import 'dart:ui';

import 'package:balloon/games/balloon/balloon_game.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';

class Player extends SpriteComponent with DragCallbacks, HasGameRef<BalloonGame> {
  Vector2? dragStartPosition;
  double initialX = 0;

  Rect get topLine => Rect.fromLTWH(x, y, width, 1);

  @override
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    dragStartPosition = event.canvasPosition;
    initialX = x;
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (dragStartPosition != null) {
      final dragDelta = event.canvasStartPosition - dragStartPosition!;
      x = (initialX + dragDelta.x).clamp(0, gameRef.size.x - width);
    }
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    dragStartPosition = null;
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    super.onDragCancel(event);
    dragStartPosition = null;
  }
}
