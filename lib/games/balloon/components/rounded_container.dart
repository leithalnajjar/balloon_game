import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class RoundedContainerComponent extends PositionComponent {
  final String text;
  final double radius;
  final TextPaint textRenderer;
  final Paint backgroundPaint;

  RoundedContainerComponent({
    required this.text,
    required this.radius,
    required this.textRenderer,
    required this.backgroundPaint,
    required Vector2 size,
    required Vector2 position,
  }) {
    this.size = size;
    this.position = position;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the rounded rectangle
    final rect = Rect.fromLTWH(0, 0, size.x, size.y);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(rrect, backgroundPaint);

    // Render the text in the center
    textRenderer.render(
      canvas,
      text,
      Vector2(size.x / 2, size.y / 2),
      anchor: Anchor.center,
    );
  }
}
