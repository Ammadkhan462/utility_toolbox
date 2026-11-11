import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import '../providers/ip_ping_providers.dart';

String _netErrorText(AppLocalizations l, NetError e) => switch (e) {
      NetError.offline => l.commonErrorOffline,
      NetError.timeout => l.commonErrorTimeout,
      NetError.hostNotFound => l.pingErrorHostNotFound,
      NetError.noData => l.pingErrorNoData,
      NetError.generic => l.commonErrorGeneric,
    };

/// Wraps an IP / hostname so RTL text around it can't reorder its parts.
String _ltr(String s) => '\u2066$s\u2069';

class IpPingScreen extends ConsumerStatefulWidget {
  const IpPingScreen({super.key});

  @override
  ConsumerState<IpPingScreen> createState() => _IpPingScreenState();
}

class _IpPingScreenState extends ConsumerState<IpPingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  final _lookupCtrl = TextEditingController();
  final _pingCtrl   = TextEditingController(text: 'google.com');

  static final _accent = AppColors.toolAccent('ip_ping');

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
    // The providers are autoDispose; keep them alive while this screen is
    // open so switching tabs doesn't drop results or stop a running ping.
    ref.listenManual(ipInfoProvider, (_, _) {});
    ref.listenManual(lookupProvider, (_, _) {});
    ref.listenManual(pingProvider, (_, _) {});
  }

  @override
  void dispose() {
    _tabs.dispose();
    _lookupCtrl.dispose();
    _pingCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return ToolScaffold(
      title: l.toolIpPingTitle,
      accentColor: _accent,
      body: Column(
        children: [
          TabBar(
            controller: _tabs,
            tabs: [
              Tab(text: l.pingTabMyIp),
              Tab(text: l.pingTabLookup),
              Tab(text: l.pingTabPing),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: [
                _MyIpTab(accent: _accent),
                _LookupTab(ctrl: _lookupCtrl, accent: _accent),
                _PingTab(ctrl: _pingCtrl, accent: _accent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── My IP Tab ────────────────────────────────────────────────────────────────

class _MyIpTab extends ConsumerWidget {
  final Color accent;
  const _MyIpTab({required this.accent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(ipInfoProvider);
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error:   (e, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off_rounded,
                  size: 40, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(height: 12),
              Text(_netErrorText(l, netErrorOf(e)), textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton.tonalIcon(
                onPressed: () => ref.invalidate(ipInfoProvider),
                icon: const Icon(Icons.refresh_rounded),
                label: Text(l.commonRetry),
              ),
            ],
          ),
        ),
      ),
      data: (info) => SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // IP card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.toolGradient('ip_ping'),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(Icons.language_rounded, color: Colors.white, size: 36),
                  const SizedBox(height: 10),
                  Text(
                    info.ip,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.pingYourPublicIp,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _InfoTile(icon: Icons.location_city_rounded, label: l.pingFieldCity,     value: info.city),
            _InfoTile(icon: Icons.map_rounded,           label: l.pingFieldRegion,   value: info.region),
            _InfoTile(icon: Icons.flag_rounded,          label: l.pingFieldCountry,  value: info.country),
            _InfoTile(icon: Icons.business_rounded,      label: l.pingFieldIsp,      value: info.org),
            _InfoTile(icon: Icons.schedule_rounded,      label: l.pingFieldTimezone, value: info.timezone, ltr: true),
            _InfoTile(icon: Icons.place_rounded,         label: l.pingFieldLocation, value: info.loc, ltr: true),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: info.ip));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l.pingIpCopied)),
                );
              },
              icon: const Icon(Icons.copy_rounded),
              label: Text(l.pingCopyIp),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String   label;
  final String   value;
  /// Machine-style value (IP, coordinates, tz id) that must stay LTR.
  final bool     ltr;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.ltr = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (value.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Text(
            label,
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              ltr ? _ltr(value) : value,
              textAlign: TextAlign.end,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Lookup Tab ───────────────────────────────────────────────────────────────

class _LookupTab extends ConsumerWidget {
  final TextEditingController ctrl;
  final Color accent;
  const _LookupTab({required this.ctrl, required this.accent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state   = ref.watch(lookupProvider);
    final notifier = ref.read(lookupProvider.notifier);
    final l = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ctrl,
                  keyboardType: TextInputType.url,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: l.pingLookupHint,
                    prefixIcon: const Icon(Icons.search_rounded),
                  ),
                  onSubmitted: (_) => notifier.lookup(ctrl.text),
                ),
              ),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: state.isLoading ? null : () => notifier.lookup(ctrl.text),
                child: state.isLoading
                    ? SizedBox(
                        width: 18, height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                          semanticsLabel: l.commonWorking,
                        ),
                      )
                    : Text(l.pingLookupButton),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (state.error != null)
            Text(
              _netErrorText(l, state.error!),
              style: const TextStyle(color: AppColors.error),
            ),
          if (state.info != null) ...[
            _InfoTile(icon: Icons.language_rounded,      label: l.pingFieldIp,       value: state.info!.ip, ltr: true),
            _InfoTile(icon: Icons.location_city_rounded, label: l.pingFieldCity,     value: state.info!.city),
            _InfoTile(icon: Icons.map_rounded,           label: l.pingFieldRegion,   value: state.info!.region),
            _InfoTile(icon: Icons.flag_rounded,          label: l.pingFieldCountry,  value: state.info!.country),
            _InfoTile(icon: Icons.business_rounded,      label: l.pingFieldIsp,      value: state.info!.org),
            _InfoTile(icon: Icons.schedule_rounded,      label: l.pingFieldTimezone, value: state.info!.timezone, ltr: true),
          ],
        ],
      ),
    );
  }
}

// ── Ping Tab ─────────────────────────────────────────────────────────────────

class _PingTab extends ConsumerWidget {
  final TextEditingController ctrl;
  final Color accent;
  const _PingTab({required this.ctrl, required this.accent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state    = ref.watch(pingProvider);
    final notifier = ref.read(pingProvider.notifier);
    final theme    = Theme.of(context);
    final l        = AppLocalizations.of(context);
    final ms       = NumberFormat('0', l.localeName);
    final count    = NumberFormat.decimalPattern(l.localeName);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ctrl,
                  keyboardType: TextInputType.url,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    hintText: l.pingHostHint,
                    prefixIcon: const Icon(Icons.terminal_rounded),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: () {
                  if (state.isRunning) {
                    notifier.stop();
                  } else {
                    notifier.clear();
                    notifier.start(ctrl.text.trim());
                  }
                },
                child: Text(state.isRunning ? l.commonStop : l.pingStartButton),
              ),
            ],
          ),
        ),
        if (state.hostNotFound)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Row(
              children: [
                const Icon(Icons.error_outline_rounded,
                    color: AppColors.error, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l.pingErrorHostNotFound,
                    style: const TextStyle(color: AppColors.error),
                  ),
                ),
              ],
            ),
          ),
        if (state.resolvedIp != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l.pingHeader(_ltr(state.host), _ltr(state.resolvedIp!)),
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ),
          ),
        if (state.results.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Wrap(
              spacing: 10,
              runSpacing: 8,
              children: [
                _StatBadge(label: l.pingStatAvg, value: '${ms.format(state.avgMs)} ms', color: accent),
                _StatBadge(
                  label: l.pingStatLoss,
                  value: NumberFormat.percentPattern(l.localeName)
                      .format(state.packetLoss / 100),
                  color: state.packetLoss > 20 ? Colors.red : Colors.green,
                ),
                _StatBadge(label: l.pingStatSent, value: count.format(state.results.length), color: Colors.grey),
              ],
            ),
          ),
        ],
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            itemCount: state.results.length,
            itemBuilder: (_, i) {
              final r = state.results[i];
              final timeout = r.ms == null;
              final valueText =
                  timeout ? l.pingTimeout : '${ms.format(r.ms!)} ms';
              return Semantics(
                label: '#${count.format(r.seq)}',
                value: valueText,
                excludeSemantics: true,
                child: Row(
                  children: [
                    SizedBox(
                      width: 48,
                      child: Text(
                        '#${count.format(r.seq)}',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: timeout ? 0 : ((r.ms ?? 0).clamp(0, 500) / 500),
                        color: timeout
                            ? Colors.red
                            : (r.ms! < 50 ? Colors.green : Colors.orange),
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 70),
                      child: Text(
                        valueText,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: timeout ? Colors.red : null,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color  color;
  const _StatBadge({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(fontSize: 11, color: color.withValues(alpha: 0.7)),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
