

// import 'managers/enemy_manager.dart';

import 'dart:math';


import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_game/game/behaviors/chase_player_behavior.dart';
import 'package:flutter_game/game/behaviors/random_movement_behavior.dart';
import 'package:flutter_game/game/managers/enemy_pool.dart';
// import 'package:flame/parallax.dart';
// import 'package:flutter/material.dart';

import 'blocs/game_bloc.dart';
import 'components/player.dart';
import 'managers/bullet_pool.dart';
import 'managers/game_manager.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents{
  final GameBloc gameBloc;
  late Player player;
  late GameManager gameManager;
  late BulletPool bulletPool;
  late EnemyPool enemyPool;
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
    bulletPool = BulletPool();
    enemyPool = EnemyPool();

    player = Player(onPlayerHit: () {
      gameBloc.add(DecreaseLives());
    }, bulletPool: bulletPool);
    add(player);

    //spawn some enemys for now
    spawnEnemies(5);

    // enemyManager = EnemyManager();
    // add(enemyManager);

  }

  void spawnEnemies(int count) {
    final random = Random();
    for (var i = 0; i < count; i++) {
      //randommize position
      final position = Vector2(
        random.nextDouble() * size.x,
        random.nextDouble() * size.y,
      );

      final behavior = random.nextBool()
          ? RandomMovementBehavior(speed: 100)
          : ChasePlayerBehavior(player, speed: 150);

      final enemy = enemyPool.getEnemy(position, behavior);

      add(enemy);
    
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