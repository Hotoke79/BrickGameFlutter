import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../brick_breaker.dart';

class PlayArea extends RectangleComponent with
   HasGameReference<BrickBreaker> {
  PlayArea()
  : super(
    paint: Paint()..color = const Color(0xff303646),
    children: [RectangleHitbox()]
  );

  @override
  FutureOr<void> onLoad() async{
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}