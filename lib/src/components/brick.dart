import 'dart:ui';

import 'package:brick_game/src/brick_breaker.dart';
import 'package:brick_game/src/components/bat.dart';
import 'package:brick_game/src/config.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'ball.dart';

class Brick extends RectangleComponent with CollisionCallbacks, HasGameReference<BrickBreaker>{
  Brick({
    required super.position,
    required Color color
  }) :super(
    size: Vector2(brickWidth, brickHeight),
    anchor: Anchor.center,
    paint: Paint() ..color = color ..style = PaintingStyle.fill,
    children: [RectangleHitbox()]
  );
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollisionStart
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();
    if(game.world.children.query<Brick>().length==1){
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}