

import 'package:flame/components.dart';
import 'package:flutter_game/game/behaviors/behavior.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

class Enemy extends SpriteComponent with HasGameRef<SpaceShooterGame>{

  bool active = false;
  Behavior behavior;
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

    if(!active) return;
    
    behavior.update(dt, this);

    //make shure they dont dissapear from screen.
    if (position.x > gameRef.size.x) { position.x = 0;}
    if (position.x < 0) {position.x = gameRef.size.x;}
    if (position.y > gameRef.size.y) {position.y = 0;}
    if (position.y < 0) {position.y = gameRef.size.y;}

  }

  void reset(Vector2 startPosition, Behavior newBehavior) {
    position = startPosition;
    behavior = newBehavior;
    active = true;
  }

}