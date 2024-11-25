

// import 'managers/enemy_manager.dart';

import 'dart:math';


import 'package:flame/events.dart';
import 'package:flame/game.dart';
// import 'package:flame/parallax.dart';
// import 'package:flutter/material.dart';

import 'blocs/game_bloc.dart';
import 'components/enemy.dart';
import 'components/player.dart';
import 'managers/game_manager.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents{
  final GameBloc gameBloc;
  late Player player;
  late GameManager gameManager;
  // late EnemyManager enemyManager;

  SpaceShooterGame({required this.gameBloc});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // final parallax = await loadParallaxComponent(
    //   [
    //     ParallaxImageData('background_layer1.png'),
    //     ParallaxImageData('background_layer2.png'),
    //     ParallaxImageData('background_layer3.png'),
    //     ParallaxImageData('background_layer4.png'),
    //   ],
    //   baseVelocity: Vector2(0, -5),
    //   repeat: ImageRepeat.repeat,
    //   velocityMultiplierDelta: Vector2(0, 5),
    // );

    // add(parallax);

    gameManager = GameManager(gameBloc: gameBloc, game: this);

    player = Player(onPlayerHit: () {
      gameBloc.add(DecreaseLives());
    });
    add(player);

    //spawn some enemys for now
    spawnEnemys(2);

    // enemyManager = EnemyManager();
    // add(enemyManager);

  }

  void spawnEnemys(int count) {
    final random = Random();
    for (var i = 0; i < count; i++) {
      //randommize position
      final position = Vector2(
        random.nextDouble() * size.x,
        random.nextDouble() * size.y,
      );
      add(Enemy(
        position,
        // onEnemyDestroyed: handleEnemyDestroyed,
      ));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    gameManager.checkCollisions();
  }

  void resetGame() {
    gameBloc.add(ResetGame());
  }
}