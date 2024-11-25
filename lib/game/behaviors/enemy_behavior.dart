

import '../components/enemy.dart';

abstract class EnemyBehavior {
  void initialize(Enemy enemy);
  void update(Enemy enemy, double dt);
}

class LinearMovementStrategy extends EnemyBehavior {
    @override
    void initialize(Enemy enemy) {

    }

    @override
    void update(Enemy enemy, double dt) {
        enemy.position.y += enemy.speed * dt;
    }
}