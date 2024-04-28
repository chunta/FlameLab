import 'package:flame/cache.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:logger/logger.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class MyGame extends FlameGame with TapCallbacks {
  late MyPlayer player;
  var deviceSize = Vector2.zero();
  static const double screenWidth = 900;
  static const double screenHeight = 1600;
  var tapCount = 0;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  Future<void> onLoad() async {
    super.onLoad();
    print(size);
    deviceSize = size;  
    camera = 
    CameraComponent.withFixedResolution(width: screenWidth, height: screenHeight);
    camera.viewport.debugColor = Colors.pink;
  }
  @override
  void onMount() {
    createReact(Vector2(0, -750), Vector2(50, 50), Colors.white);
    createReact(Vector2(450, 0), Vector2(50, 50), Colors.white);
    createReact(Vector2(-450, 0), Vector2(50, 50), Colors.white);
    createReact(
        Vector2(0, 800), 
        Vector2(screenWidth, screenHeight / 7), 
        Colors.white);
    
    world.add(player = MyPlayer());

    debugMode = true;
    super.onMount();
  }

  void createReact(Vector2 pos, Vector2 size, Color color) {
    var rectangleCom = RectangleComponent(position: pos, size: size);
    rectangleCom.anchor = Anchor.bottomCenter;
    rectangleCom.paint = Paint()..color = color;
    world.add(rectangleCom);
  }

  void createBackgroundImage(Vector2 pos, Vector2 size) async {
    final image = await images.load('background.png');
    final spriteComponent = SpriteComponent();
    spriteComponent.sprite = await loadSprite("background.png");
    spriteComponent.size = size;
    add(spriteComponent);

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
