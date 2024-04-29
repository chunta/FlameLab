import 'package:flame/components.dart';

class Player extends SpriteComponent {
  Player(Vector2 position, Anchor anchor, Sprite sprite) {
    this.position = position;
    this.anchor = anchor;
    this.sprite = sprite;
  }

  @override
  void onMount() {
    super.onMount();
    anchor = Anchor.bottomCenter;
  }

  @override
  void onRemove() {
    print('onRemove');
    super.onRemove();
  }
}
