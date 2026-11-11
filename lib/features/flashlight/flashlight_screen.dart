import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility_toolbox/core/platform/system_bridge.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/flashlight/flashlight_logic.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Torch with steady / SOS / strobe modes. Uses the camera flash LED through
/// [SystemBridge] (no camera permission) and falls back to a full-screen
/// "screen light" when there is no flash or another app holds the camera.
class FlashlightScreen extends StatefulWidget {
  const FlashlightScreen({super.key});

  @override
  State<FlashlightScreen> createState() => _FlashlightScreenState();
}

class _ScreenColor {
  const _ScreenColor(this.color, this.label);

  final Color color;
  final String Function(AppLocalizations l) label;
}

final _screenColors = <_ScreenColor>[
  _ScreenColor(Colors.white, (l) => l.flashlightColorWhite),
  _ScreenColor(const Color(0xFFFFE0A3), (l) => l.flashlightColorWarm),
  _ScreenColor(const Color(0xFFFF1E1E), (l) => l.flashlightColorRed),
  _ScreenColor(const Color(0xFF2EE66B), (l) => l.flashlightColorGreen),
  _ScreenColor(const Color(0xFF3D8BFF), (l) => l.flashlightColorBlue),
];

class _FlashlightScreenState extends State<FlashlightScreen> {
  static const _accent = Color(0xFFF57C00);

  late final _torch = _TorchDriver(onFailure: _onTorchFailed);

  /// null while we ask the phone whether it has a flash.
  bool? _hasTorch;
  bool _torchFailed = false;
  bool _preferScreen = false;

  /// The user switched the light on (the pattern may be in an "off" phase).
  bool _on = false;

  /// Whether the light is lit right now.
  bool _lit = false;

  FlashMode _mode = FlashMode.steady;
  double _hz = 4;
  int _colorIndex = 0;

  Timer? _timer;
  List<LightStep> _pattern = const [];
  int _step = 0;

  bool get _screenMode => _preferScreen || _hasTorch == false || _torchFailed;

  @override
  void initState() {
    super.initState();
    SystemBridge.instance.hasTorch().then((has) {
      if (!mounted) return;
      setState(() => _hasTorch = has);
      if (_on && !has) _restart(); // tapped before the check finished
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    // Always switch the LED off when leaving, even mid-pattern.
    _torch.dispose();
    if (_brightScreen) SystemBridge.instance.setScreenBrightness(null);
    super.dispose();
  }

  // ── Pattern playback ────────────────────────────────────────────────────

  void _toggle() {
    HapticFeedback.mediumImpact();
    if (_on) {
      _stop();
    } else {
      setState(() => _on = true);
      _restart();
    }
  }

  void _stop() {
    _timer?.cancel();
    _timer = null;
    _torch.set(false);
    if (mounted) {
      setState(() {
        _on = false;
        _lit = false;
      });
    }
  }

  void _restart() {
    _timer?.cancel();
    _timer = null;
    if (!_on) return;
    _pattern = patternFor(_mode, strobeHz: _hz, screen: _screenMode);
    _step = 0;
    _runStep();
  }

  void _runStep() {
    if (!mounted || !_on || _pattern.isEmpty) return;
    final step = _pattern[_step];
    _setLit(step.on);
    if (step.ms <= 0) return; // steady: stay as is
    _timer = Timer(Duration(milliseconds: step.ms), () {
      _step = (_step + 1) % _pattern.length;
      _runStep();
    });
  }

  void _setLit(bool lit) {
    if (!_screenMode) _torch.set(lit);
    if (_lit != lit) setState(() => _lit = lit);
  }

  void _onTorchFailed() {
    if (!mounted || _torchFailed) return;
    setState(() => _torchFailed = true);
    if (_hasTorch == true) {
      ScaffoldMessenger.maybeOf(
        context,
      )?.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).flashlightTorchBusy)));
    }
    _restart(); // continue the same pattern on the screen
  }

  void _setMode(FlashMode mode) {
    if (mode == _mode) return;
    HapticFeedback.selectionClick();
    setState(() => _mode = mode);
    _restart();
  }

  void _setPreferScreen(bool value) {
    if (value) _torch.set(false);
    setState(() => _preferScreen = value);
    _restart();
  }

  // ── UI ──────────────────────────────────────────────────────────────────

  /// Screen light runs at full brightness; normal brightness comes back as
  /// soon as it's switched off or the screen closes.
  bool _brightScreen = false;

  void _syncBrightness() {
    final want = _on && _screenMode;
    if (want == _brightScreen) return;
    _brightScreen = want;
    SystemBridge.instance.setScreenBrightness(want ? 1.0 : null);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _syncBrightness();
    });
    if (_on && _screenMode) return _buildScreenLight(l);
    return ToolScaffold(title: l.toolFlashlightTitle, accentColor: _accent, body: _buildControls(context, l));
  }

  Widget _buildScreenLight(AppLocalizations l) {
    final color = _screenColors[_colorIndex].color;
    final bg = _lit ? color : Colors.black;
    final hint = bg.computeLuminance() > 0.4 ? Colors.black54 : Colors.white70;
    return PopScope(
      canPop: false,
      // Back turns the light off first instead of leaving the tool.
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _stop();
      },
      child: Semantics(
        button: true,
        label: l.flashlightTurnOff,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _toggle,
          child: ColoredBox(
            color: bg,
            child: SafeArea(
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(32),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.touch_app_rounded, color: hint),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          l.flashlightTapToTurnOff,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: hint, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls(BuildContext context, AppLocalizations l) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final buttonSize = (width * 0.55).clamp(160.0, 230.0);
    final glow = _on && _lit;

    return ListView(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 24),
      children: [
        const SizedBox(height: 8),
        Text(
          _on ? l.flashlightOn : l.flashlightOff,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: _on ? _accent : theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Semantics(
            button: true,
            toggled: _on,
            label: _on ? l.flashlightTurnOff : l.flashlightTurnOn,
            excludeSemantics: true,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: buttonSize,
              height: buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _on ? const RadialGradient(colors: [Color(0xFFFFE082), Color(0xFFFFA726)]) : null,
                color: _on ? null : theme.colorScheme.surface,
                border: Border.all(color: _on ? const Color(0xFFFFCC80) : theme.colorScheme.outlineVariant, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: glow ? const Color(0xFFFFA726).withValues(alpha: 0.6) : Colors.black.withValues(alpha: 0.12),
                    blurRadius: glow ? 48 : 16,
                    spreadRadius: glow ? 8 : 0,
                  ),
                ],
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: _toggle,
                  child: Icon(
                    Icons.power_settings_new_rounded,
                    size: buttonSize * 0.42,
                    color: _on ? Colors.white : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        SegmentedButton<FlashMode>(
          showSelectedIcon: false,
          segments: [
            ButtonSegment(
              value: FlashMode.steady,
              icon: const Icon(Icons.flashlight_on_rounded),
              label: Text(l.flashlightModeSteady),
            ),
            ButtonSegment(value: FlashMode.sos, icon: const Icon(Icons.sos_rounded), label: Text(l.flashlightModeSos)),
            ButtonSegment(
              value: FlashMode.strobe,
              icon: const Icon(Icons.flare_rounded),
              label: Text(l.flashlightModeStrobe),
            ),
          ],
          selected: {_mode},
          onSelectionChanged: (s) => _setMode(s.first),
        ),
        const SizedBox(height: 12),
        if (_mode == FlashMode.sos)
          Text(
            l.flashlightSosHint,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        if (_mode == FlashMode.strobe) ...[
          Text(
            l.flashlightStrobeSpeed(clampStrobeHz(_hz, screen: _screenMode).round()),
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          Slider(
            value: clampStrobeHz(_hz, screen: _screenMode),
            min: strobeMinHz,
            max: _screenMode ? screenStrobeMaxHz : strobeMaxHz,
            divisions: ((_screenMode ? screenStrobeMaxHz : strobeMaxHz) - strobeMinHz).round(),
            label: '${clampStrobeHz(_hz, screen: _screenMode).round()}',
            semanticFormatterCallback: (v) => l.flashlightStrobeSpeed(v.round()),
            onChanged: (v) {
              setState(() => _hz = v);
              _restart();
            },
          ),
        ],
        const SizedBox(height: 12),
        if (_hasTorch == false || _torchFailed)
          _Notice(
            icon: Icons.info_outline_rounded,
            text: _hasTorch == false ? l.flashlightNoTorch : l.flashlightTorchBusy,
          )
        else
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.smartphone_rounded),
              title: Text(l.flashlightUseScreen),
              subtitle: Text(l.flashlightUseScreenHint),
              value: _preferScreen,
              onChanged: _hasTorch == null ? null : _setPreferScreen,
            ),
          ),
        if (_screenMode) ...[
          const SizedBox(height: 16),
          Text(l.flashlightScreenColor, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (var i = 0; i < _screenColors.length; i++)
                _ColorDot(
                  color: _screenColors[i].color,
                  label: _screenColors[i].label(l),
                  selected: i == _colorIndex,
                  onTap: () => setState(() => _colorIndex = i),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({required this.color, required this.label, required this.selected, required this.onTap});

  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: Tooltip(
        message: label,
        child: InkResponse(
          onTap: onTap,
          radius: 28,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: selected ? scheme.primary : scheme.outlineVariant, width: selected ? 4 : 1.5),
            ),
            child: selected ? const Icon(Icons.check_rounded, color: Colors.black54) : null,
          ),
        ),
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsetsDirectional.all(14),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: scheme.onSecondaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: TextStyle(color: scheme.onSecondaryContainer)),
          ),
        ],
      ),
    );
  }
}

/// Serialises torch calls: the platform call takes a few ms, and a fast
/// strobe must not queue up stale on/off requests. Only the latest wish is
/// sent; a failed "on" reports once through [onFailure].
class _TorchDriver {
  _TorchDriver({required this.onFailure});

  final VoidCallback onFailure;

  bool _desired = false;
  bool _actual = false;
  bool _busy = false;
  bool _disposed = false;
  bool _everOn = false;

  void set(bool on) {
    if (_disposed) return;
    _desired = on;
    _pump();
  }

  Future<void> _pump() async {
    if (_busy) return;
    _busy = true;
    try {
      while (!_disposed && _actual != _desired) {
        final target = _desired;
        final ok = await SystemBridge.instance.setTorch(target);
        if (!ok && target) {
          _desired = false;
          if (!_disposed) onFailure();
          break;
        }
        _actual = target;
        if (target) _everOn = true;
      }
    } finally {
      _busy = false;
    }
  }

  void dispose() {
    _disposed = true;
    // Also when an "on" is still in flight: channel calls run in order, so
    // this "off" lands after it.
    if (_everOn || _actual || _desired) {
      SystemBridge.instance.setTorch(false);
    }
  }
}
