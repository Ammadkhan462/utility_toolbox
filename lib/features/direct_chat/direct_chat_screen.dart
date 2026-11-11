import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/currency_converter/currency_data.dart' show flagEmoji;
import 'package:utility_toolbox/features/direct_chat/calling_codes.dart';
import 'package:utility_toolbox/features/direct_chat/phone_utils.dart';
import 'package:utility_toolbox/features/percentage_calculator/calc_widgets.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Start a chat with a number that isn't saved in contacts.
class DirectChatScreen extends StatefulWidget {
  const DirectChatScreen({super.key, this.initialText});

  /// Text shared into the tool; a phone number in it pre-fills the field.
  final String? initialText;

  @override
  State<DirectChatScreen> createState() => _DirectChatScreenState();
}

const _kHistory = 'direct_chat_history';
const _kCountry = 'direct_chat_country';
const _maxHistory = 10;

// Unicode LEFT-TO-RIGHT ISOLATE / POP DIRECTIONAL ISOLATE.
final _lri = String.fromCharCode(0x2066);
final _pdi = String.fromCharCode(0x2069);

class _DirectChatScreenState extends State<DirectChatScreen> {
  final _phone = TextEditingController();
  final _message = TextEditingController();
  late final String? _deviceIso = WidgetsBinding.instance.platformDispatcher.locale.countryCode;

  late CallingCode _country = callingCodeForIso(_deviceIso) ?? callingCodeForIso('US')!;
  List<String> _history = [];
  bool _showErrors = false;
  bool _countryFromInput = false;
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    final shared = widget.initialText?.trim();
    if (shared != null && shared.isNotEmpty) {
      final number = extractPhoneNumber(shared);
      if (number != null) {
        _applyNumber(number);
      } else {
        _message.text = shared;
      }
    }
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    _prefs = prefs;
    setState(() {
      _history = prefs.getStringList(_kHistory) ?? [];
      final saved = callingCodeForIso(prefs.getString(_kCountry));
      if (saved != null && !_countryFromInput) _country = saved;
    });
  }

  @override
  void dispose() {
    _phone.dispose();
    _message.dispose();
    super.dispose();
  }

  /// Puts [raw] into the field; an international number also selects its
  /// country so the field shows only the national part.
  void _applyNumber(String raw) {
    final trimmed = raw.trim();
    final digits = trimmed.replaceAll(RegExp(r'\D'), '');
    final international = trimmed.startsWith('+') || digits.startsWith('00');
    if (international) {
      final full = digits.startsWith('00') ? digits.substring(2) : digits;
      final cc = callingCodeForNumber(full, preferIso: _deviceIso);
      if (cc != null) {
        _country = cc;
        _countryFromInput = true;
        _phone.text = full.substring(cc.dial.length);
        return;
      }
    }
    _phone.text = trimmed;
  }

  Future<void> _paste() async {
    final l = AppLocalizations.of(context);
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;
    final number = extractPhoneNumber(data?.text ?? '');
    if (number == null) {
      _snack(l.directChatPasteNone);
      return;
    }
    setState(() => _applyNumber(number));
  }

  void _snack(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _open() async {
    final l = AppLocalizations.of(context);
    final result = normalizePhone(_phone.text, _country.dial);
    if (!result.isValid) {
      setState(() => _showErrors = true);
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    var ok = false;
    try {
      ok = await launchUrl(
        chatLink(result.digits, _message.text),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      ok = false;
    }
    if (!mounted) return;
    if (!ok) {
      _snack(l.directChatOpenFailed);
      return;
    }
    setState(() {
      _history = [
        result.digits,
        ..._history.where((d) => d != result.digits),
      ].take(_maxHistory).toList();
    });
    await _prefs?.setStringList(_kHistory, _history);
    await _prefs?.setString(_kCountry, _country.iso);
  }

  Future<void> _removeHistory(String digits) async {
    setState(() => _history = _history.where((d) => d != digits).toList());
    await _prefs?.setStringList(_kHistory, _history);
  }

  Future<void> _clearHistory() async {
    setState(() => _history = []);
    await _prefs?.remove(_kHistory);
  }

  Future<void> _pickCountry() async {
    final picked = await showModalBottomSheet<CallingCode>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => _CountryPicker(selected: _country),
    );
    if (!mounted || picked == null) return;
    setState(() {
      _country = picked;
      _countryFromInput = true;
    });
    await _prefs?.setString(_kCountry, picked.iso);
  }

  String? _errorText(AppLocalizations l, PhoneResult r) {
    if (r.issue == PhoneIssue.tooLong) return l.directChatTooLong;
    if (!_showErrors) return null;
    return switch (r.issue) {
      PhoneIssue.empty || PhoneIssue.tooShort => l.directChatTooShort,
      PhoneIssue.tooLong => l.directChatTooLong,
      null => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final accent = ToolRegistry.byId('direct_chat')?.accent ?? const Color(0xFF2ECC8A);
    final result = normalizePhone(_phone.text, _country.dial);

    return ToolScaffold(
      title: l.toolDirectChatTitle,
      accentColor: accent,
      body: ListView(
        padding: EdgeInsetsDirectional.fromSTEB(
          16,
          12,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 24,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Text(
            l.directChatHint,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 12),
          CalcCard(
            accent: accent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CountryButton(country: _country, onTap: _pickCountry),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _phone,
                        keyboardType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        autofillHints: const [AutofillHints.telephoneNumberNational],
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-() .٠-٩۰-۹०-९০-৯]')),
                          LengthLimitingTextInputFormatter(24),
                        ],
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          labelText: l.directChatPhone,
                          errorText: _errorText(l, result),
                          errorMaxLines: 2,
                          suffixIcon: IconButton(
                            tooltip: l.directChatPaste,
                            icon: const Icon(Icons.content_paste_rounded),
                            onPressed: _paste,
                          ),
                        ),
                        // A number typed with "+" is used as-is (it overrides
                        // the selected country code).
                        onChanged: (_) => setState(() => _showErrors = false),
                      ),
                    ),
                  ],
                ),
                if (result.isValid) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.check_circle_rounded, size: 18, color: accent),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          // Isolate the number so it stays left-to-right
                          // inside Arabic / Urdu sentences.
                          l.directChatWillOpen(
                            '$_lri${displayPhone(result.digits, _country.dial)}$_pdi',
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                TextField(
                  controller: _message,
                  minLines: 2,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(labelText: l.directChatMessage),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PremiumButton(
            label: l.directChatOpen,
            icon: Icons.chat_rounded,
            accent: accent,
            onPressed: _open,
          ),
          if (_history.isNotEmpty) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.recent,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(onPressed: _clearHistory, child: Text(l.commonClear)),
              ],
            ),
            const SizedBox(height: 4),
            ListCard(
              children: [
                for (final digits in _history)
                  _HistoryTile(
                    digits: digits,
                    deviceIso: _deviceIso,
                    onTap: () => setState(() {
                      _applyNumber('+$digits');
                      _showErrors = false;
                    }),
                    onDelete: () => _removeHistory(digits),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 20),
          Text(
            l.directChatNotAffiliated,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _CountryButton extends StatelessWidget {
  const _CountryButton({required this.country, required this.onTap});

  final CallingCode country;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      label: '${l.directChatCountryCode}: ${country.name} +${country.dial}',
      excludeSemantics: true,
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56, minWidth: 48),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(flagEmoji(country.iso), style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 6),
                  Text(
                    '+${country.dial}',
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.digits,
    required this.deviceIso,
    required this.onTap,
    required this.onDelete,
  });

  final String digits;
  final String? deviceIso;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final cc = callingCodeForNumber(digits, preferIso: deviceIso);
    return ListTile(
      leading: ExcludeSemantics(
        child: Text(cc == null ? '🌐' : flagEmoji(cc.iso), style: const TextStyle(fontSize: 24)),
      ),
      title: Text(
        cc == null ? '+$digits' : displayPhone(digits, cc.dial),
        textDirection: TextDirection.ltr,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: cc == null ? null : Text(cc.name),
      onTap: onTap,
      trailing: IconButton(
        tooltip: l.fileRemoveFromList,
        icon: const Icon(Icons.delete_outline_rounded),
        onPressed: onDelete,
      ),
    );
  }
}

class _CountryPicker extends StatefulWidget {
  const _CountryPicker({required this.selected});

  final CallingCode selected;

  @override
  State<_CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<_CountryPicker> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final q = _search.text.trim().toLowerCase().replaceAll('+', '');
    final items = q.isEmpty
        ? callingCodes
        : callingCodes
              .where(
                (c) =>
                    c.name.toLowerCase().contains(q) ||
                    c.iso.toLowerCase() == q ||
                    c.dial.startsWith(q),
              )
              .toList();

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
                  hintText: l.directChatSearchCountry,
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
              child: items.isEmpty
                  ? Center(child: Text(l.directChatNoCountry, style: theme.textTheme.bodyMedium))
                  : ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final c = items[i];
                        return ListTile(
                          leading: ExcludeSemantics(
                            child: Text(flagEmoji(c.iso), style: const TextStyle(fontSize: 24)),
                          ),
                          title: Text(c.name),
                          trailing: Text(
                            '+${c.dial}',
                            textDirection: TextDirection.ltr,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          selected: c.iso == widget.selected.iso,
                          onTap: () => Navigator.of(context).pop(c),
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
