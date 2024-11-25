

import 'package:flame/components.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

class Enemy extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  double speed = 100;
  late Vector2 direction;

  Enemy( Vector2 initialPosition) : super(size: Vector2.all(30.0)) {
    position = initialPosition;
    
    //for now move in random direction
    direction = (Vector2.random() - Vector2(0.5, 0.5)).normalized();
  }

  @override
  Future<void> onLoad() async {

    sprite = await gameRef.loadSprite('enemy_spaceship.png');
  }

  @override
  void update (double dt) {
    super.update(dt);
    
    position += direction * speed * dt;

    if (position.x > gameRef.size.x) position.x = 0;
    if (position.x < 0) position.x = gameRef.size.x;
    if (position.y > gameRef.size.y) position.y = 0;
    if (position.y < 0) position.y = gameRef.size.y; 
  }

}