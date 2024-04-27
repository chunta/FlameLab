import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:logger/logger.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class MyGame extends FlameGame with TapCallbacks {
  late MyPlayer player;

  var tapCount = 0;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  MyGame()
      : super(
            camera:
                CameraComponent.withFixedResolution(width: 900, height: 1600));

  @override
  void onMount() {
    createReact(Vector2(0, -750));
    createReact(Vector2(450, 0));
    createReact(Vector2(-450, 0));
    createReact(Vector2(0, 800));

    world.add(player = MyPlayer());

    debugMode = true;

    super.onMount();
  }

  void createReact(Vector2 pos) {
    var rectangleCom = RectangleComponent(position: pos, size: Vector2(50, 50));
    rectangleCom.anchor = Anchor.bottomCenter;
    world.add(rectangleCom);
  }

  @override
  Color backgroundColor() => Colors.green;

  @override
  void onTapDown(TapDownEvent event) {
    logger.d('onTapDown $tapCount');
    tapCount++;
    player.jump();
    super.onTapDown(event);
  }
}
