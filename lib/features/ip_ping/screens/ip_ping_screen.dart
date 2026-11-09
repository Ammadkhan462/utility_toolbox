import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../providers/ip_ping_providers.dart';

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
    return ToolScaffold(
      title: 'IP & Ping',
      accentColor: _accent,
      body: Column(
        children: [
          TabBar(
            controller: _tabs,
            tabs: const [
              Tab(text: 'My IP'),
              Tab(text: 'Lookup'),
              Tab(text: 'Ping'),
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

    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error:   (e, _) => Center(child: Text('Error: $e')),
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
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your Public IP',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _InfoTile(icon: Icons.location_city_rounded, label: 'City',     value: info.city),
            _InfoTile(icon: Icons.map_rounded,           label: 'Region',   value: info.region),
            _InfoTile(icon: Icons.flag_rounded,          label: 'Country',  value: info.country),
            _InfoTile(icon: Icons.business_rounded,      label: 'ISP / Org', value: info.org),
            _InfoTile(icon: Icons.schedule_rounded,      label: 'Timezone', value: info.timezone),
            _InfoTile(icon: Icons.place_rounded,         label: 'Location', value: info.loc),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: info.ip));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('IP copied')),
                );
              },
              icon: const Icon(Icons.copy_rounded),
              label: const Text('Copy IP'),
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

  const _InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (value.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
          const Spacer(),
          Flexible(
            child: Text(
              value,
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
                  decoration: const InputDecoration(
                    hintText: 'IP address or hostname',
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                  onSubmitted: (_) => notifier.lookup(ctrl.text),
                ),
              ),
              const SizedBox(width: 10),
              FilledButton(
                onPressed: state.isLoading ? null : () => notifier.lookup(ctrl.text),
                child: state.isLoading
                    ? const SizedBox(
                        width: 18, height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Lookup'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (state.error != null)
            Text(state.error!, style: const TextStyle(color: AppColors.error)),
          if (state.info != null) ...[
            _InfoTile(icon: Icons.language_rounded,      label: 'IP',       value: state.info!.ip),
            _InfoTile(icon: Icons.location_city_rounded, label: 'City',     value: state.info!.city),
            _InfoTile(icon: Icons.map_rounded,           label: 'Region',   value: state.info!.region),
            _InfoTile(icon: Icons.flag_rounded,          label: 'Country',  value: state.info!.country),
            _InfoTile(icon: Icons.business_rounded,      label: 'ISP',      value: state.info!.org),
            _InfoTile(icon: Icons.schedule_rounded,      label: 'Timezone', value: state.info!.timezone),
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ctrl,
                  decoration: const InputDecoration(
                    hintText: 'Hostname (e.g. google.com)',
                    prefixIcon: Icon(Icons.terminal_rounded),
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
                child: Text(state.isRunning ? 'Stop' : 'Ping'),
              ),
            ],
          ),
        ),
        if (state.resolvedIp != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Text(
              'PING ${state.host} (${state.resolvedIp}) via HTTP',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
        if (state.results.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Row(
              children: [
                _StatBadge(label: 'Avg', value: '${state.avgMs.toStringAsFixed(0)} ms', color: accent),
                const SizedBox(width: 10),
                _StatBadge(label: 'Loss', value: '${state.packetLoss}%',
                    color: state.packetLoss > 20 ? Colors.red : Colors.green),
                const SizedBox(width: 10),
                _StatBadge(label: 'Pkts', value: '${state.results.length}', color: Colors.grey),
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
              return Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      'seq=${r.seq}',
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
                  SizedBox(
                    width: 70,
                    child: Text(
                      timeout ? 'timeout' : '${r.ms!.toStringAsFixed(0)} ms',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: timeout ? Colors.red : null,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
      child: RichText(
        text: TextSpan(
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
