import 'package:flame/components.dart';

import '../behaviors/random_movement_behavior.dart';
import '../components/enemy.dart';
import '../behaviors/behavior.dart';

class EnemyPool {
  final List<Enemy> _pool = [];
  final int _initialSize;
  final int _maxSize;

  EnemyPool({int initialSize = 10, int maxSize = 30})
      : _initialSize = initialSize,
        _maxSize = maxSize {
    for (var i = 0; i < _initialSize; i++) {
      _pool.add(
          Enemy(position: Vector2.zero(), behavior: RandomMovementBehavior())
            ..active = false);
    }
  }

  Enemy getEnemy(Vector2 startPosition, Behavior behavior) {
    for (var enemy in _pool) {
      if (!enemy.active) {
        enemy.reset(startPosition, behavior);
        enemy.active = true;
        return enemy;
      }
    }

    if (_pool.length < _maxSize) {
      final newEnemy = Enemy(position: startPosition, behavior: behavior)
        ..active = true;
      _pool.add(newEnemy);
      return newEnemy;
    }

    throw Exception('Enemy pool exhausted');
  }

  void releaseEnemy(Enemy enemy) {
    enemy.active = false;
  }
}
