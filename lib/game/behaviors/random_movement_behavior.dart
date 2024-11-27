import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_game/game/behaviors/behavior.dart';

class RandomMovementBehavior implements Behavior {
  final double speed;

  RandomMovementBehavior(
      {this.speed = 100});


  @override
  void update(double dt, PositionComponent enemy) {
    final direction = Vector2.random();
    enemy.position.add(direction * speed * dt);

  }
}
