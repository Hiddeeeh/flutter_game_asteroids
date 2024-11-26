

import 'package:flame/components.dart';
import 'package:flutter_game/game/behaviors/behavior.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

class Enemy extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  final Behavior behavior;
  double speed = 100;
  late Vector2 direction;

  Enemy({
    required Vector2 position,
    required this.behavior
    }) : super(position: position, size: Vector2.all(30.0));

  @override
  Future<void> onLoad() async {

    sprite = await gameRef.loadSprite('enemy_spaceship.png');
  }

  @override
  void update (double dt) {
    super.update(dt);
    
    behavior.update(dt, this);

  }

}