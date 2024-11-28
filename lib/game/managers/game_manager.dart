import 'dart:math';

import 'package:flame/game.dart';
import 'package:flutter_game/game/blocs/game_state.dart';

import '../blocs/game_bloc.dart';
import '../components/bullet.dart';
import '../components/enemy.dart';
import '../components/player.dart';

class GameManager {
  final GameBloc gameBloc;
  final FlameGame game;

  GameManager({required this.gameBloc, required this.game});

  void checkCollisions() {
    final enemies = game.children.whereType<Enemy>().toList();
    final bullets = game.children.whereType<Bullet>().toList();
    final player = game.children.whereType<Player>().isEmpty
        ? null
        : game.children.whereType<Player>().first;

    for (var enemy in enemies) {
      for (var bullet in bullets) {
        if (bullet.toRect().overlaps(enemy.toRect())) {
          enemy.onHit();
          bullet.removeFromParent();

          gameBloc.add(InCreaseScore(10));
        }
      }
      if (player != null && enemy.toRect().overlaps(player.toRect())) {
        enemy.position = Vector2.random();

        gameBloc.add(DecreaseLives());
      }
    }
  }

  void resetGame() {
    gameBloc.add(ResetGame());

    final bullets = game.children.whereType<Bullet>().toList();
    final enemies = game.children.whereType<Enemy>().toList();
    for (var bullet in bullets) {
      bullet.removeFromParent();
    }
    for (var enemy in enemies) {
      enemy.removeFromParent();
    }

    final player = game.children.whereType<Player>().isEmpty
        ? null
        : game.children.whereType<Player>().first;
    player?.reset();

    game.overlays.remove('GameWonMenu');
    game.overlays.remove('GameOverMenu');
    game.overlays.add('HUD');
  }
}
