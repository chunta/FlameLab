import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MyPlayer extends PositionComponent {
  double speed = 30.0;
  final _velocity = Vector2(0, 20.0);
  final _gravity = 900.0;
  final _jumpSpeed = 350.0;
  @override
  void onMount() {
    super.onMount();
    position = Vector2(0, 0);
    anchor = Anchor.center;
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
