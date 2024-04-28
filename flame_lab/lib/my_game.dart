import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:logger/logger.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player player;
  var deviceSize = Vector2.zero();
  static const double screenWidth = 900;
  static const double screenHeight = 1600;
  var tapCount = 0;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    deviceSize = size;
    camera = CameraComponent.withFixedResolution(
        width: screenWidth, height: screenHeight);
  }

  @override
  void onMount() {
    createReact(Vector2(0, -screenHeight / 2), Vector2(50, 50), Colors.white,
        anchor: Anchor.topCenter);
    createReact(Vector2(screenWidth / 2, 0), Vector2(50, 50), Colors.white,
        anchor: Anchor.centerRight);
    createReact(Vector2(-screenWidth / 2, 0), Vector2(50, 50), Colors.white,
        anchor: Anchor.centerLeft);
    createReact(Vector2(0, screenHeight / 2), Vector2(50, 50), Colors.white,
        anchor: Anchor.bottomCenter);

    createBackgroundImage(Vector2(0, 0));

    createPlayer(Vector2(0, screenHeight / 2));

    debugMode = true;
    super.onMount();
  }

  void createReact(Vector2 pos, Vector2 size, Color color,
      {Anchor anchor = Anchor.bottomCenter}) {
    var rectangleCom = RectangleComponent(position: pos, size: size);
    rectangleCom.anchor = anchor;
    rectangleCom.paint = Paint()..color = color;
    world.add(rectangleCom);
  }

  void createBackgroundImage(Vector2 pos) async {
    final spriteComponent = SpriteComponent(priority: -1);
    final backgroundImage = await images.load('background.png');
    var scaleFactor = screenWidth / backgroundImage.size.x;
    final backgroundSprite =
        Sprite(backgroundImage, srcSize: backgroundImage.size);
    spriteComponent.scale = Vector2(scaleFactor, scaleFactor);
    spriteComponent.sprite = backgroundSprite;
    spriteComponent.position = pos;
    spriteComponent.anchor = Anchor.center;
    spriteComponent.autoResize = true;
    world.add(spriteComponent);
  }

  void createPlayer(Vector2 pos) async {
    final playerImage = await images.load('wizard.png');
    final playerSprite = Sprite(playerImage, srcSize: playerImage.size);
    player = Player(pos, Anchor.bottomCenter, playerSprite);
    var expectedWidth = screenWidth * 0.3;
    var scaleFactor = expectedWidth / playerImage.size.x;
    player.scale = Vector2(scaleFactor, scaleFactor);
    player.anchor = Anchor.bottomCenter;
    world.add(player);
  }

  @override
  Color backgroundColor() => Colors.black;
}
