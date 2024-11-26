

import 'package:flame/components.dart';

import '../components/player.dart';
import 'behavior.dart';

class ChasePlayerBehavior implements Behavior {
  final double speed;
  final Player player;

  ChasePlayerBehavior(this.player, {this.speed = 150});

  @override
  void update(double dt, PositionComponent enemy) {
    final direction = (player.position - enemy.position).normalized();
    enemy.position.add(direction * speed * dt);
  }
}