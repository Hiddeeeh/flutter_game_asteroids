

import 'package:flame/game.dart';

import '../blocs/game_bloc.dart';
import '../components/bullet.dart';
import '../components/enemy.dart';

class GameManager {
  final GameBloc gameBloc;
  final FlameGame game;

  GameManager({required this.gameBloc, required this.game});

  void checkCollisions() {
    final enemies = game.children.whereType<Enemy>().toList();
    final bullets = game.children.whereType<Bullet>().toList();

    for (var bullet in bullets) {
      for (var enemy in enemies) {
        if (bullet.toRect().overlaps(enemy.toRect())) {
          bullet.removeFromParent();
          enemy.removeFromParent();

          gameBloc.add(InCreaseScore(10));
        }
      }
    }
  }


}