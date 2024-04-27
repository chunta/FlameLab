import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame with TapCallbacks {
  late MyComponent myComponent;

  var tapCount = 0;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  MyGame() {
    add(myComponent = MyComponent());
  }

  @override
  Color backgroundColor() => Colors.redAccent;

  @override
  void onTapDown(TapDownEvent event) {
    logger.d('onTapDown $tapCount');
    tapCount++;
    myComponent.jump();
    super.onTapDown(event);
  }
}

class MyComponent extends PositionComponent {
  double speed = 30.0;
  final _velocity = Vector2(0, 20.0);
  final _gravity = 900.0;
  final _jumpSpeed = 350.0;
  @override
  void onMount() {
    super.onMount();
    position = Vector2(100, 0);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
    _velocity.y += _gravity * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(position.toOffset(), 15, Paint()..color = Colors.yellow);
  }

  @override
  void onRemove() {
    print('onRemove');
    super.onRemove();
  }

  void jump() {
    _velocity.y = -_jumpSpeed;
  }
}
