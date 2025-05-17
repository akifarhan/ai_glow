import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class OuterAiGlow extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;
  final double glowWidth;
  final double blure;
  final List<Color> colors;

  const OuterAiGlow({
    super.key,
    required this.child,
    this.height = 100,
    this.width = 100,
    this.borderRadius = 10,
    this.glowWidth = 2,
    this.blure = 5,
    this.colors = const [Colors.blue, Colors.purple, Colors.pink],
  });

  @override
  State<OuterAiGlow> createState() => _OuterAiGlowState();
}

class _OuterAiGlowState extends State<OuterAiGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder:
                (_, __) => CustomPaint(
                  painter: _GlowPainter(
                    animationValue: _controller.value,
                    colors: widget.colors,
                    borderRadius: widget.borderRadius,
                    glowWidth: widget.glowWidth,
                    blure: widget.blure,
                  ),
                  child:
                      const SizedBox.expand(), // Ensures the glow fills the space
                ),
          ),
          widget.child,
        ],
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double animationValue;
  final List<Color> colors;
  final double borderRadius;
  final double glowWidth;
  final double blure;

  _GlowPainter({
    required this.animationValue,
    required this.colors,
    required this.borderRadius,
    required this.glowWidth,
    required this.blure,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final RRect roundedRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final stops = List.generate(colors.length + 1, (i) => i / (colors.length));

    final sweepGradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * pi,
      colors: [...colors, colors.first],
      stops: stops,
      transform: GradientRotation(2 * pi * animationValue),
    );

    final Paint glowStrokePaint =
        Paint()
          ..shader = sweepGradient.createShader(rect.inflate(glowWidth))
          ..style = PaintingStyle.stroke
          ..strokeWidth = glowWidth
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blure);

    canvas.drawRRect(roundedRect.deflate(1.0), glowStrokePaint);
  }

  @override
  bool shouldRepaint(covariant _GlowPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue ||
        colors != oldDelegate.colors ||
        borderRadius != oldDelegate.borderRadius;
  }
}
