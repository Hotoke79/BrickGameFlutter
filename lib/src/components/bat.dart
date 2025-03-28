import 'dart:ui';

import 'package:brick_game/src/brick_breaker.dart';
import 'package:brick_game/src/config.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';

class Bat extends PositionComponent with DragCallbacks, HasGameReference<BrickBreaker>{
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
}) : super(
    anchor: Anchor.center,
    children: [RectangleHitbox()]
  );

  final _paint = Paint()
  ..color = const Color(0xffffffff)
  ..style = PaintingStyle.fill;

  final Radius cornerRadius;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
        RRect.fromRectAndRadius(Offset.zero & size.toSize(), cornerRadius), _paint
    );
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x).clamp(0, gameWidth);
  }
  void moveBy(double dx){
    add(MoveToEffect(
    Vector2((position.x+dx).clamp(0, game.width), position.y),
      EffectController(duration: 0.1)
    ));
  }
}