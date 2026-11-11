// ignore_for_file: deprecated_member_use
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/glass_card.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import '../providers/wifi_speed_providers.dart';

/// Speed / latency with one decimal, in the app's number format.
String _fmt1(BuildContext context, double v) =>
    NumberFormat('0.0', AppLocalizations.of(context).localeName).format(v);

String _fmt0(BuildContext context, double v) =>
    NumberFormat('0', AppLocalizations.of(context).localeName).format(v);

String _errorText(AppLocalizations l, SpeedTestError? e) => switch (e) {
      SpeedTestError.offline => l.speedErrorOffline,
      SpeedTestError.timeout => l.speedErrorTimeout,
      _ => l.speedErrorFailed,
    };

class WifiSpeedTestScreen extends ConsumerStatefulWidget {
  const WifiSpeedTestScreen({super.key});

  @override
  ConsumerState<WifiSpeedTestScreen> createState() =>
      _WifiSpeedTestScreenState();
}

class _WifiSpeedTestScreenState extends ConsumerState<WifiSpeedTestScreen>
    with SingleTickerProviderStateMixin {
  static const _downloadColor = Color(0xFF00CFFF);
  static const _uploadColor = Color(0xFFCE93D8);
  static final _accent = AppColors.toolAccent('wifi_speed_test');

  final _pageController = PageController();

  late final AnimationController _pulseCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pageController.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  void _handlePhaseChange(SpeedTestPhase phase) {
    if (!_pageController.hasClients) return;
    if (phase == SpeedTestPhase.download) {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else if (phase == SpeedTestPhase.upload) {
      _pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(speedTestProvider);
    final notifier = ref.read(speedTestProvider.notifier);

    ref.listen<SpeedTestState>(
      speedTestProvider,
      (_, next) => _handlePhaseChange(next.phase),
    );

    return ToolScaffold(
      title: AppLocalizations.of(context).toolSpeedTestTitle,
      accentColor: _accent,
      body: _buildBody(context, state, notifier),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SpeedTestState state,
    SpeedTestNotifier notifier,
  ) {
    final l = AppLocalizations.of(context);
    if (state.isIdle) {
      return _IdleView(
        accent: _accent,
        pulse: _pulseCtrl,
        onStart: () {
          notifier.reset();
          Future.microtask(() => notifier.runTest());
        },
      );
    }

    if (state.isTesting && state.phase == SpeedTestPhase.locate) {
      return _LocatingView(text: l.speedSelectingServer);
    }

    if (state.isTesting && state.phase == SpeedTestPhase.ping) {
      return _LocatingView(text: l.speedPhasePing);
    }

    if (state.isTesting) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _PhaseLabel(phase: state.phase, accent: _accent),
            if (state.pingMs != null) ...[
              const SizedBox(height: 8),
              _PingChip(pingMs: state.pingMs!, accent: _accent),
            ],
            const SizedBox(height: 8),
            SizedBox(
              height: 400,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _GaugePage(
                    label: l.speedDownloadSpeed,
                    labelColor: _downloadColor,
                    value: state.phase == SpeedTestPhase.download
                        ? state.liveMbps
                        : state.downloadMbps,
                    pointerColor: _downloadColor,
                    maxValue: 150,
                  ),
                  _GaugePage(
                    label: l.speedUploadSpeed,
                    labelColor: _uploadColor,
                    value: state.phase == SpeedTestPhase.upload
                        ? state.liveMbps
                        : state.uploadMbps,
                    pointerColor: _uploadColor,
                    maxValue: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (state.serverIp != null) _IpCard(ip: state.serverIp!),
            const SizedBox(height: 24),
            TextButton(
              onPressed: notifier.cancel,
              child: Text(
                l.commonCancel,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (state.isError) {
      return _ErrorView(
        message: _errorText(l, state.error),
        onRetry: () {
          notifier.reset();
          Future.microtask(() => notifier.runTest());
        },
        accent: _accent,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _ResultWidget(
            downloadMbps: state.downloadMbps,
            uploadMbps: state.uploadMbps,
            pingMs: state.pingMs,
          ),
          const SizedBox(height: 16),
          if (state.serverIp != null) _IpCard(ip: state.serverIp!),
          const SizedBox(height: 32),
          _GoButton(
            label: l.speedRunAgain,
            accent: _accent,
            onTap: () {
              notifier.reset();
              Future.microtask(() => notifier.runTest());
            },
          ),
          const SizedBox(height: 24),
          Text(
            state.serverLocation != null
                ? l.speedMeasuredVia(state.serverLocation!)
                : l.speedPoweredBy,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.45),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _IdleView extends StatelessWidget {
  final Color accent;
  final Animation<double> pulse;
  final VoidCallback onStart;
  const _IdleView({
    required this.accent,
    required this.pulse,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l.toolSpeedTestTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${l.speedPoweredBy}\n${l.speedIdleHint}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 56),
            _GoButton(
              accent: accent,
              pulse: pulse,
              onTap: onStart,
              label: l.speedGo,
            ),
          ],
        ),
      ),
    );
  }
}

class _GoButton extends StatelessWidget {
  final Color accent;
  final Animation<double>? pulse;
  final VoidCallback onTap;
  final String label;
  const _GoButton({
    required this.accent,
    required this.onTap,
    this.pulse,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final button = Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent, width: 3.0),
          ),
          child: Center(
            // Long words ("Erneut testen") shrink instead of overflowing.
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );

    if (pulse == null) return button;

    return AnimatedBuilder(
      animation: pulse!,
      builder: (context, child) {
        final t = pulse!.value;
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: accent.withOpacity(0.18 + t * 0.12),
                blurRadius: 30 + t * 20,
                spreadRadius: 4 + t * 6,
              ),
            ],
          ),
          child: child,
        );
      },
      child: button,
    );
  }
}

class _LocatingView extends StatelessWidget {
  final String text;
  const _LocatingView({required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _PingChip extends StatelessWidget {
  final double pingMs;
  final Color accent;
  const _PingChip({required this.pingMs, required this.accent});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${l.speedPing}: ${_fmt0(context, pingMs)} ms',
        style: TextStyle(color: accent, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _GaugePage extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double value;
  final Color pointerColor;
  final double maxValue;

  const _GaugePage({
    required this.label,
    required this.labelColor,
    required this.value,
    required this.pointerColor,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        Semantics(
          label: label,
          value: '${_fmt1(context, value)} Mbps',
          excludeSemantics: true,
          child: _SpeedGaugeWidget(
            value: value,
            unit: 'Mbps',
            pointerColor: pointerColor,
            maxValue: maxValue,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
//  Gauge — now animates smoothly from its CURRENT position to the new
//  target every update, instead of snapping from 0 each time.
// ─────────────────────────────────────────────────────────────────────────

class _SpeedGaugeWidget extends StatefulWidget {
  final double value;
  final String unit;
  final Color pointerColor;
  final double maxValue;

  const _SpeedGaugeWidget({
    required this.value,
    required this.unit,
    required this.pointerColor,
    required this.maxValue,
  });

  @override
  State<_SpeedGaugeWidget> createState() => _SpeedGaugeWidgetState();
}

class _SpeedGaugeWidgetState extends State<_SpeedGaugeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late Animation<double> _animation = AlwaysStoppedAnimation(widget.value);

  @override
  void initState() {
    super.initState();
    _animateTo(widget.value);
  }

  @override
  void didUpdateWidget(covariant _SpeedGaugeWidget old) {
    super.didUpdateWidget(old);
    if (old.value != widget.value) _animateTo(widget.value);
  }

  void _animateTo(double target) {
    final begin = _animation.value;
    _animation = Tween<double>(
      begin: begin,
      end: target,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              final effectiveMax = widget.value < 15
                  ? 25.0
                  : (widget.value < 50
                      ? 60.0
                      : math.max(widget.maxValue, widget.value * 1.15));
              final clamped = _animation.value.clamp(0.0, effectiveMax);
              return CustomPaint(
                size: const Size(280, 280),
                painter: _GaugePainter(
                  value: clamped,
                  maxValue: effectiveMax,
                  trackColor: theme.colorScheme.surfaceContainerHighest,
                  pointerColor: widget.pointerColor,
                  needleColor: theme.colorScheme.onSurface,
                ),
              );
            },
          ),
          Positioned(
            bottom: 68,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, _) => Text(
                '${_fmt1(context, _animation.value.clamp(0.0, double.infinity))} ${widget.unit}',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.pointerColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double value;
  final double maxValue;
  final Color trackColor;
  final Color pointerColor;
  final Color needleColor;

  _GaugePainter({
    required this.value,
    required this.maxValue,
    required this.trackColor,
    required this.pointerColor,
    required this.needleColor,
  });

  static const double _startAngle = math.pi * 0.75;
  static const double _sweepFull = math.pi * 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 20;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
      rect,
      _startAngle,
      _sweepFull,
      false,
      Paint()
        ..color = trackColor.withOpacity(0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round,
    );

    final frac = maxValue > 0 ? (value / maxValue).clamp(0.0, 1.0) : 0.0;
    if (frac > 0) {
      canvas.drawArc(
        rect,
        _startAngle,
        _sweepFull * frac,
        false,
        Paint()
          ..color = pointerColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 14
          ..strokeCap = StrokeCap.round,
      );
    }

    final needleAngle = _startAngle + _sweepFull * frac;
    final needleLength = radius - 24;
    final tip = Offset(
      center.dx + needleLength * math.cos(needleAngle),
      center.dy + needleLength * math.sin(needleAngle),
    );
    final perp = needleAngle + math.pi / 2;
    const halfWidth = 4.0;
    final base1 = Offset(
      center.dx + halfWidth * math.cos(perp),
      center.dy + halfWidth * math.sin(perp),
    );
    final base2 = Offset(
      center.dx - halfWidth * math.cos(perp),
      center.dy - halfWidth * math.sin(perp),
    );

    final needlePath = Path()
      ..moveTo(base1.dx, base1.dy)
      ..lineTo(tip.dx, tip.dy)
      ..lineTo(base2.dx, base2.dy)
      ..close();

    canvas.drawShadow(needlePath, Colors.black, 3, false);
    canvas.drawPath(needlePath, Paint()..color = needleColor);

    canvas.drawCircle(center, 10, Paint()..color = needleColor);
    canvas.drawCircle(center, 5, Paint()..color = trackColor.withOpacity(0.9));
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.value != value ||
      old.maxValue != maxValue ||
      old.pointerColor != pointerColor ||
      old.needleColor != needleColor;
}

class _ResultWidget extends StatelessWidget {
  final double downloadMbps;
  final double uploadMbps;
  final double? pingMs;
  const _ResultWidget({
    required this.downloadMbps,
    required this.uploadMbps,
    required this.pingMs,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.speed_rounded,
                color: Color(0xFF00CFFF),
                size: 22,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l.speedResultsTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _ResultColumn(
                  icon: Icons.arrow_circle_down_rounded,
                  color: const Color(0xFF00CFFF),
                  label: l.speedDownload,
                  value: _fmt1(context, downloadMbps),
                  unit: 'Mbps',
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              ),
              Expanded(
                child: _ResultColumn(
                  icon: Icons.arrow_circle_up_rounded,
                  color: const Color(0xFFCE93D8),
                  label: l.speedUpload,
                  value: _fmt1(context, uploadMbps),
                  unit: 'Mbps',
                ),
              ),
            ],
          ),
          if (pingMs != null) ...[
            const SizedBox(height: 18),
            _ResultColumn(
              icon: Icons.network_ping_rounded,
              color: const Color(0xFF81C784),
              label: l.speedPing,
              value: _fmt0(context, pingMs!),
              unit: 'ms',
              compact: true,
            ),
          ],
        ],
      ),
    );
  }
}

class _ResultColumn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;
  final String unit;
  final bool compact;
  const _ResultColumn({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
    required this.unit,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      label: label,
      value: '$value $unit',
      excludeSemantics: true,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: (compact
                            ? theme.textTheme.titleLarge
                            : theme.textTheme.headlineMedium)
                        ?.copyWith(fontWeight: FontWeight.w800, color: color),
                  ),
                  TextSpan(
                    text: ' $unit',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IpCard extends StatelessWidget {
  final String ip;
  const _IpCard({required this.ip});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.public_rounded, color: Color(0xFF00CFFF), size: 20),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              // The IP itself is isolated so RTL text doesn't reorder it.
              AppLocalizations.of(context).speedConnectedIp('\u2066$ip\u2069'),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final Color accent;
  const _ErrorView({
    required this.message,
    required this.onRetry,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.error.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                const Icon(Icons.wifi_off_rounded, color: AppColors.error),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: AppColors.error),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          PremiumButton(
            onPressed: onRetry,
            icon: Icons.refresh_rounded,
            label: AppLocalizations.of(context).commonRetry,
            gradient: AppColors.toolGradient('wifi_speed_test'),
          ),
        ],
      ),
    );
  }
}

class _PhaseLabel extends StatefulWidget {
  final SpeedTestPhase phase;
  final Color accent;
  const _PhaseLabel({required this.phase, required this.accent});

  @override
  State<_PhaseLabel> createState() => _PhaseLabelState();
}

class _PhaseLabelState extends State<_PhaseLabel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _text(AppLocalizations l) => switch (widget.phase) {
        SpeedTestPhase.locate => l.speedSelectingServer,
        SpeedTestPhase.ping => l.speedPhasePing,
        SpeedTestPhase.download => l.speedPhaseDownload,
        SpeedTestPhase.upload => l.speedPhaseUpload,
        SpeedTestPhase.idle => '',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = _text(AppLocalizations.of(context));
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        final dots = '.' * ((_ctrl.value * 3).floor() + 1);
        return Text(
          '$text$dots',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: widget.accent,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        );
      },
    );
  }
}
