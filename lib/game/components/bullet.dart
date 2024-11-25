

import 'package:flame/components.dart';

import '../space_shooter_game.dart';

class Bullet extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  final double speed = 400.0;
  late Vector2 direction;

  Bullet(Vector2 initialPosition): super(position: initialPosition, size: Vector2.all(10.0)) {
      direction = Vector2(0, -1);
    }

  @override
  Future<void> onLoad() async{
    sprite = await gameRef.loadSprite('bullet.png');

  }

  @override
  void update(double dt) {
    super.update(dt);

    //moving the bullet
    position += direction * speed * dt;

    //removing the bullet when off screen
    if (position.y < 0 || position.y > gameRef.size.y || position.x < 0 || position.x > gameRef.size.x) {
      removeFromParent();
    }

  }
}