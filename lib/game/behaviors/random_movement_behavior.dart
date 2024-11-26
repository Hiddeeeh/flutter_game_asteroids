

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_game/game/behaviors/behavior.dart';

class RandomMovementBehavior implements Behavior{
  final double speed;
  final Random random = Random();

  RandomMovementBehavior({this.speed = 100});

  @override
  void update(double dt, PositionComponent enemy) {
    enemy.position.add(Vector2(
      (random.nextDouble() - 0.5) * speed * dt,
      (random.nextDouble() - 0.5) * speed * dt,
      ));
  }
}