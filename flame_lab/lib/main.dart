import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame {
  late MyComponent myComponent;
  MyGame() {
    add(myComponent = MyComponent());
  }

  @override
  Color backgroundColor() => Colors.redAccent;

  void myTestFunction() async {
    await Future.delayed(const Duration(seconds: 1));
    remove(myComponent);
  }
}

class MyComponent extends Component {
  double speed = 30.0;
  Vector2 position = Vector2(100, 100);

  @override
  void onMount() {
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position = Vector2(position.x, 
    position.y + dt * speed);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(position.toOffset(),
    15,
    Paint()..color = Colors.yellow
    );
  }

  @override
  void onRemove() {
    print('onRemove');
    super.onRemove();
  }
}
