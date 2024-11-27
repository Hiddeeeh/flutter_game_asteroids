

import 'package:flame/components.dart';

import '../space_shooter_game.dart';

class Bullet extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  bool active = false;
  final double speed = 400.0;
  Vector2 direction = Vector2.zero();

  Bullet(Vector2 position): super(position: position, size: Vector2.all(10.0));

  @override
  Future<void> onLoad() async{
    sprite = await gameRef.loadSprite('bullet.png');

  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!active) return;

    //moving the bullet
    position += direction * speed * dt;

    //removing the bullet when off screen
    if (position.y < 0 || position.y > gameRef.size.y || position.x < 0 || position.x > gameRef.size.x) {
      active = false;
    }

  }

  void reset(Vector2 startPosition, Vector2 directionVector) {
    position = startPosition;
    direction = directionVector;
    active = true;
  }
}