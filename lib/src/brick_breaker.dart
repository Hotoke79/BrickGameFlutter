

import 'dart:async';
import 'dart:ui';

import 'package:brick_game/src/components/ball.dart';
import 'package:brick_game/src/components/bat.dart';
import 'package:brick_game/src/components/brick.dart';
import 'package:brick_game/src/components/play_area.dart';
import 'package:brick_game/src/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'dart:math' as math;

import 'package:flutter/src/services/hardware_keyboard.dart';

import 'package:flutter/src/services/keyboard_key.g.dart';

import 'package:flutter/src/widgets/focus_manager.dart';

class BrickBreaker extends FlameGame with HasCollisionDetection, KeyboardEvents{
  BrickBreaker()
  : super(
    camera: CameraComponent.withFixedResolution(width: gameWidth, height: gameHeight)
  );

  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async{
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());
    world.add(Ball(
        velocity: Vector2((rand.nextDouble()-0.5)*width, height).normalized()..scale(height/5),
        position: size/2,
        radius: ballRadius,
        difficultyModifier: difficultyModifier
    )
    );
    world.add(Bat
      (
        cornerRadius: Radius.circular(ballRadius/2),
        position: Vector2(width/2, height*0.95),
        size: Vector2(batWidth, batHeight)));

        await world.addAll([
          for(var i=0; i<brickColors.length; i++)
          for(var j =1; j<=5;j++)
          Brick(
            position: Vector2(
              (i+0.5)*brickWidth+(i+1)*brickGutter,
               (j+2.0)*brickHeight+j*brickGutter,
              ),
              color: brickColors[i]
          )
        ]);
    debugMode = true;
  }
  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // TODO: implement onKeyEvent
    //return super.onKeyEvent(event, keysPressed);
    super.onKeyEvent(event, keysPressed);
    switch(event.logicalKey){
      case LogicalKeyboardKey.arrowLeft:
      world.children.query<Bat>().first.moveBy(-batStep);
      case LogicalKeyboardKey.arrowRight:
      world.children.query<Bat>().first.moveBy(batStep);
    }
    return KeyEventResult.handled;
  }
}