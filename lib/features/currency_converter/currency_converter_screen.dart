import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/currency_converter/currency_data.dart';
import 'package:utility_toolbox/features/currency_converter/currency_rates.dart';
import 'package:utility_toolbox/features/percentage_calculator/calc_widgets.dart';
import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Currency converter: instant result, favourites, works offline from the
/// last downloaded rate table.
class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

const _kFrom = 'currency_from';
const _kTo = 'currency_to';
const _kFavorites = 'currency_favorites';
const _kRecent = 'currency_recent';
const _kAmount = 'currency_amount';
const _maxRecent = 6;

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _service = CurrencyRatesService();
  final _amount = TextEditingController(text: '1');

  SharedPreferences? _prefs;
  RateTable? _table;
  bool _loading = false;
  bool _refreshFailed = false;
  bool _initialised = false;
  double _swapTurns = 0;

  late String _from;
  late String _to;
  List<String> _favorites = [];
  List<String> _recent = [];

  @override
  void initState() {
    super.initState();
    final country = WidgetsBinding.instance.platformDispatcher.locale.countryCode;
    _from = currencyForCountry(country) ?? 'USD';
    _to = _from == 'USD' ? 'EUR' : 'USD';
    _favorites = _defaultFavorites(_from);
    _init();
  }

  static List<String> _defaultFavorites(String local) =>
      {local, 'USD', 'EUR', 'GBP', 'SAR', 'AED'}.take(6).toList();

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = await _service.loadCached();
    if (!mounted) return;
    _prefs = prefs;
    setState(() {
      _from = prefs.getString(_kFrom) ?? _from;
      _to = prefs.getString(_kTo) ?? _to;
      _favorites = prefs.getStringList(_kFavorites) ?? _favorites;
      _recent = prefs.getStringList(_kRecent) ?? _recent;
      final amount = prefs.getString(_kAmount);
      if (amount != null && amount.isNotEmpty) _amount.text = amount;
      _table = cached;
      _initialised = true;
    });
    if (cached == null || CurrencyRatesService.isStale(cached)) {
      await _refresh();
    }
  }

  Future<void> _refresh() async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      final table = await _service.fetch();
      if (!mounted) return;
      setState(() {
        _table = table;
        _refreshFailed = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _refreshFailed = true);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _prefs?.setString(_kAmount, _amount.text);
    _amount.dispose();
    super.dispose();
  }

  void _persist() {
    final p = _prefs;
    if (p == null) return;
    p.setString(_kFrom, _from);
    p.setString(_kTo, _to);
    p.setStringList(_kFavorites, _favorites);
    p.setStringList(_kRecent, _recent);
  }

  void _remember(String code) {
    _recent = [code, ..._recent.where((c) => c != code)].take(_maxRecent).toList();
  }

  void _swap() {
    HapticFeedback.selectionClick();
    setState(() {
      final t = _from;
      _from = _to;
      _to = t;
      _swapTurns += 0.5;
    });
    _persist();
  }

  void _toggleFavorite(String code) {
    setState(() {
      _favorites = _favorites.contains(code)
          ? (_favorites.toList()..remove(code))
          : [..._favorites, code];
    });
    _persist();
  }

  List<String> get _available {
    final t = _table;
    if (t == null) return fiatCurrencyCodes;
    return fiatCurrencyCodes.where(t.has).toList();
  }

  Future<void> _pick({required bool from}) async {
    final code = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => _CurrencyPicker(
        codes: _available,
        selected: from ? _from : _to,
        favorites: _favorites,
        recent: _recent,
        onToggleFavorite: _toggleFavorite,
      ),
    );
    if (!mounted || code == null) return;
    setState(() {
      if (from) {
        if (code == _to) _to = _from;
        _from = code;
      } else {
        if (code == _from) _from = _to;
        _to = code;
      }
      _remember(code);
    });
    _persist();
  }

  // ── Formatting ───────────────────────────────────────────────────────────

  String get _locale => NumberLocale.of(context);

  double? get _amountValue =>
      parseLooseNumber(_amount.text, decimalSeparator: NumberLocale.decimalSeparator(_locale));

  int _currencyDigits(String code) {
    try {
      return NumberFormat.currency(locale: 'en', name: code).decimalDigits ?? 2;
    } catch (_) {
      return 2;
    }
  }

  /// Formats [v] with the currency's usual decimals; exchange rates
  /// ([isRate]) always get at least two so "1 USD = 278.45 PKR" stays exact.
  String _money(double v, String code, {bool isRate = false}) {
    var digits = _currencyDigits(code);
    if (isRate && digits < 2) digits = 2;
    final frac = displayFractionDigits(v, digits);
    return NumberLocale.decimal(
      _locale,
      maxFraction: frac,
      minFraction: digits < frac ? digits : frac,
    ).format(v);
  }

  String _convertedText(RateTable table, double? amount, String code) {
    final v = amount == null ? null : table.convert(amount, _from, code);
    return v == null ? '—' : _money(v, code);
  }

  String _rateDate(String iso) {
    try {
      final lang = Localizations.localeOf(context).languageCode;
      return DateFormat.yMMMd(lang).format(DateTime.parse(iso));
    } catch (_) {
      return iso;
    }
  }

  // ── UI ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final accent = ToolRegistry.byId('currency_converter')?.accent ?? const Color(0xFF2ECC8A);
    final table = _table;

    return ToolScaffold(
      title: l.toolCurrencyTitle,
      accentColor: accent,
      actions: [
        if (_loading)
          const Padding(
            padding: EdgeInsetsDirectional.all(14),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2.4),
            ),
          )
        else
          IconButton(
            tooltip: l.currencyRefresh,
            onPressed: _refresh,
            icon: const Icon(Icons.refresh_rounded),
          ),
      ],
      body: !_initialised
          ? const Center(child: CircularProgressIndicator())
          : table == null
          ? _NoRates(loading: _loading, failed: _refreshFailed, onRetry: _refresh, accent: accent)
          : _buildConverter(context, l, table, accent),
    );
  }

  Widget _buildConverter(BuildContext context, AppLocalizations l, RateTable table, Color accent) {
    final theme = Theme.of(context);
    final amount = _amountValue;
    final result = amount == null ? null : table.convert(amount, _from, _to);
    final rate = table.rate(_from, _to);
    final others = _favorites.where((c) => c != _from && c != _to && table.has(c)).toList();

    return ListView(
      padding: EdgeInsetsDirectional.fromSTEB(
        16,
        12,
        16,
        MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        if (_refreshFailed) ...[
          _Banner(text: l.currencyOfflineCached, onRetry: _loading ? null : _refresh),
          const SizedBox(height: 12),
        ],
        CalcCard(
          title: l.currencyFrom,
          accent: accent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CurrencyButton(code: _from, onTap: () => _pick(from: true)),
              const SizedBox(height: 12),
              NumberField(
                controller: _amount,
                label: l.currencyAmount,
                suffix: _from,
                large: true,
                textInputAction: TextInputAction.done,
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
            child: Tooltip(
              message: l.currencySwap,
              child: Material(
                color: accent.withValues(alpha: 0.14),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: _swap,
                  child: Semantics(
                    button: true,
                    label: l.currencySwap,
                    child: SizedBox(
                      width: 52,
                      height: 52,
                      child: AnimatedRotation(
                        turns: _swapTurns,
                        duration: const Duration(milliseconds: 250),
                        child: Icon(Icons.swap_vert_rounded, color: accent, size: 28),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CalcCard(
          title: l.currencyTo,
          accent: accent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CurrencyButton(code: _to, onTap: () => _pick(from: false)),
              const SizedBox(height: 12),
              ResultPanel(
                accent: accent,
                child: Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        liveRegion: true,
                        child: Text(
                          result == null ? '—' : '${_money(result, _to)} $_to',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: accent,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: l.currencyCopy,
                      onPressed: result == null
                          ? null
                          : () async {
                              await Clipboard.setData(ClipboardData(text: _money(result, _to)));
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text(l.currencyCopied)));
                            },
                      icon: const Icon(Icons.copy_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (rate != null)
          Text(
            '1 $_from = ${_money(rate, _to, isRate: true)} $_to',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
        const SizedBox(height: 4),
        Text(
          l.currencyRatesFrom(_rateDate(table.date)),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),
        Text(
          l.currencyOtherFavorites,
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        if (others.isEmpty)
          Text(
            l.currencyFavoritesHint,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          )
        else
          ListCard(
            children: [
              for (final code in others)
                ListTile(
                  leading: _Flag(code),
                  title: Text(code, style: const TextStyle(fontWeight: FontWeight.w700)),
                  subtitle: currencyNames[code] == null ? null : Text(currencyNames[code]!),
                  trailing: Text(
                    _convertedText(table, amount, code),
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      _to = code;
                      _remember(code);
                    });
                    _persist();
                  },
                ),
            ],
          ),
        const SizedBox(height: 16),
        Text(
          l.currencyDisclaimer,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}

class _Flag extends StatelessWidget {
  const _Flag(this.code);

  final String code;

  @override
  Widget build(BuildContext context) =>
      ExcludeSemantics(child: Text(currencyFlag(code), style: const TextStyle(fontSize: 26)));
}

class _CurrencyButton extends StatelessWidget {
  const _CurrencyButton({required this.code, required this.onTap});

  final String code;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final name = currencyNames[code];
    return Semantics(
      button: true,
      label: '${l.currencyChoose}: $code ${name ?? ''}',
      excludeSemantics: true,
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  _Flag(code),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          code,
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        if (name != null)
                          Text(
                            name,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Icon(Icons.expand_more_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.text, required this.onRetry});

  final String text;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 6, 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF59E0B).withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_off_rounded, color: Color(0xFFF59E0B)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
          TextButton(onPressed: onRetry, child: Text(l.currencyRetry)),
        ],
      ),
    );
  }
}

class _NoRates extends StatelessWidget {
  const _NoRates({
    required this.loading,
    required this.failed,
    required this.onRetry,
    required this.accent,
  });

  final bool loading;
  final bool failed;
  final VoidCallback onRetry;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    if (loading || !failed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(l.currencyUpdating, style: theme.textTheme.bodyMedium),
          ],
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off_rounded, size: 64, color: accent.withValues(alpha: 0.6)),
            const SizedBox(height: 16),
            Text(
              l.currencyNoRatesTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              l.currencyNoRatesBody,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(l.currencyRetry),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Searchable picker ──────────────────────────────────────────────────────

sealed class _Row {}

class _HeaderRow extends _Row {
  _HeaderRow(this.title);
  final String title;
}

class _CodeRow extends _Row {
  _CodeRow(this.code);
  final String code;
}

class _CurrencyPicker extends StatefulWidget {
  const _CurrencyPicker({
    required this.codes,
    required this.selected,
    required this.favorites,
    required this.recent,
    required this.onToggleFavorite,
  });

  final List<String> codes;
  final String selected;
  final List<String> favorites;
  final List<String> recent;
  final ValueChanged<String> onToggleFavorite;

  @override
  State<_CurrencyPicker> createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<_CurrencyPicker> {
  final _search = TextEditingController();
  late final Set<String> _favorites = widget.favorites.toSet();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  List<_Row> _rows(AppLocalizations l) {
    final q = _search.text.trim().toLowerCase();
    final available = widget.codes.toSet();
    if (q.isNotEmpty) {
      return [
        for (final c in widget.codes)
          if (c.toLowerCase().contains(q) || (currencyNames[c]?.toLowerCase().contains(q) ?? false))
            _CodeRow(c),
      ];
    }
    final favs = widget.favorites.where(available.contains).toList();
    final recent = widget.recent.where((c) => available.contains(c) && !favs.contains(c)).toList();
    return [
      if (favs.isNotEmpty) ...[_HeaderRow(l.favorites), ...favs.map(_CodeRow.new)],
      if (recent.isNotEmpty) ...[_HeaderRow(l.recent), ...recent.map(_CodeRow.new)],
      _HeaderRow(l.currencyAll),
      ...widget.codes.map(_CodeRow.new),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final rows = _rows(l);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.85,
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: TextField(
                controller: _search,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: l.currencySearchHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _search.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: l.commonClear,
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => setState(_search.clear),
                        ),
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
            Expanded(
              child: rows.isEmpty
                  ? Center(child: Text(l.currencyNoMatch, style: theme.textTheme.bodyMedium))
                  : ListView.builder(
                      itemCount: rows.length,
                      itemBuilder: (context, i) {
                        final row = rows[i];
                        if (row is _HeaderRow) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 4),
                            child: Text(
                              row.title,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }
                        final code = (row as _CodeRow).code;
                        final fav = _favorites.contains(code);
                        final name = currencyNames[code];
                        return ListTile(
                          leading: _Flag(code),
                          title: Text(code, style: const TextStyle(fontWeight: FontWeight.w700)),
                          subtitle: name == null ? null : Text(name),
                          selected: code == widget.selected,
                          onTap: () => Navigator.of(context).pop(code),
                          trailing: IconButton(
                            tooltip: fav ? l.toolMenuRemoveFavorite : l.toolMenuAddFavorite,
                            icon: Icon(
                              fav ? Icons.star_rounded : Icons.star_outline_rounded,
                              color: fav ? const Color(0xFFF59E0B) : null,
                            ),
                            onPressed: () {
                              setState(() {
                                fav ? _favorites.remove(code) : _favorites.add(code);
                              });
                              widget.onToggleFavorite(code);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
