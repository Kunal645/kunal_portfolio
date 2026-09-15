import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _PremiumBackgroundPainter(progress: _controller.value),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _PremiumBackgroundPainter extends CustomPainter {
  final double progress;

  _PremiumBackgroundPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // ------------------------------------------------------------
    // BASE BACKGROUND
    // ------------------------------------------------------------

    final backgroundPaint =
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.background, Color(0xFF101213), Color(0xFF0B0D0E)],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // ------------------------------------------------------------
    // MOVING GRAPHITE GLOW
    // ------------------------------------------------------------

    final graphiteX =
        size.width * (0.18 + 0.08 * math.sin(progress * math.pi * 2));

    final graphiteY =
        size.height * (0.20 + 0.07 * math.cos(progress * math.pi * 2));

    final graphitePaint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color(0xFF34383A).withOpacity(0.14),
              const Color(0xFF242728).withOpacity(0.06),
              Colors.transparent,
            ],
            stops: const [0.0, 0.45, 1.0],
          ).createShader(
            Rect.fromCircle(
              center: Offset(graphiteX, graphiteY),
              radius: size.width * 0.55,
            ),
          );

    canvas.drawCircle(
      Offset(graphiteX, graphiteY),
      size.width * 0.55,
      graphitePaint,
    );

    // ------------------------------------------------------------
    // SUBTLE CHAMPAGNE GLOW
    // ------------------------------------------------------------

    final champagneX =
        size.width * (0.82 + 0.06 * math.cos(progress * math.pi * 2));

    final champagneY =
        size.height * (0.58 + 0.10 * math.sin(progress * math.pi * 2));

    final champagnePaint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              AppTheme.accent.withOpacity(0.055),
              AppTheme.accent.withOpacity(0.018),
              Colors.transparent,
            ],
            stops: const [0.0, 0.42, 1.0],
          ).createShader(
            Rect.fromCircle(
              center: Offset(champagneX, champagneY),
              radius: size.width * 0.42,
            ),
          );

    canvas.drawCircle(
      Offset(champagneX, champagneY),
      size.width * 0.42,
      champagnePaint,
    );

    // ------------------------------------------------------------
    // SECOND SOFT LIGHT
    // ------------------------------------------------------------

    final secondaryX =
        size.width * (0.48 + 0.05 * math.sin(progress * math.pi * 2 + 1.5));

    final secondaryY =
        size.height * (0.88 + 0.04 * math.cos(progress * math.pi * 2));

    final secondaryPaint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color(0xFF3B3F40).withOpacity(0.08),
              Colors.transparent,
            ],
          ).createShader(
            Rect.fromCircle(
              center: Offset(secondaryX, secondaryY),
              radius: size.width * 0.38,
            ),
          );

    canvas.drawCircle(
      Offset(secondaryX, secondaryY),
      size.width * 0.38,
      secondaryPaint,
    );

    // ------------------------------------------------------------
    // VERY SUBTLE HORIZONTAL LINE
    // ------------------------------------------------------------

    final linePaint =
        Paint()
          ..color = Colors.white.withOpacity(0.018)
          ..strokeWidth = 1;

    final lineY =
        size.height * (0.30 + 0.015 * math.sin(progress * math.pi * 2));

    canvas.drawLine(Offset(0, lineY), Offset(size.width, lineY), linePaint);

    // ------------------------------------------------------------
    // SMALL DECORATIVE DOTS
    // ------------------------------------------------------------

    _drawDot(
      canvas,
      Offset(size.width * 0.08, size.height * 0.16),
      1.2,
      AppTheme.accent.withOpacity(0.16),
    );

    _drawDot(
      canvas,
      Offset(size.width * 0.91, size.height * 0.25),
      1.0,
      Colors.white.withOpacity(0.10),
    );

    _drawDot(
      canvas,
      Offset(size.width * 0.72, size.height * 0.78),
      1.3,
      AppTheme.accent.withOpacity(0.12),
    );

    _drawDot(
      canvas,
      Offset(size.width * 0.22, size.height * 0.86),
      0.9,
      Colors.white.withOpacity(0.08),
    );
  }

  void _drawDot(Canvas canvas, Offset position, double radius, Color color) {
    final paint = Paint()..color = color;

    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _PremiumBackgroundPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
