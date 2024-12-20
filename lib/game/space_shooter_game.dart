// import 'managers/enemy_manager.dart';

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_game/game/behaviors/chase_player_behavior.dart';
import 'package:flutter_game/game/behaviors/random_movement_behavior.dart';
import 'package:flutter_game/game/components/start_music_on_interraction_component.dart';
import 'package:flutter_game/game/managers/enemy_pool.dart';


import 'blocs/game_bloc.dart';
import 'blocs/game_state.dart';
import 'components/player.dart';
import 'managers/bullet_pool.dart';
import 'managers/game_manager.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  final GameBloc gameBloc;
  late Player player;
  late GameManager gameManager;
  late BulletPool bulletPool;
  late EnemyPool enemyPool;


  SpaceShooterGame({required this.gameBloc});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await FlameAudio.audioCache.loadAll([
      'background_music.mp3',
      'laser.mp3',
      'explosion.mp3',
    ]);

    await add(
        StartMusicOnInterractionComponent()); //so the music will not bug out when launching the app.

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('background_layer1.png'),
        ParallaxImageData('background_layer2.png'),
        ParallaxImageData('background_layer3.png'),
        ParallaxImageData('background_layer4.png'),
      ],
      baseVelocity: Vector2(0, -2),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 3),
    );

    add(parallax);

    gameManager = GameManager(gameBloc: gameBloc, game: this);
    bulletPool = BulletPool();
    enemyPool = EnemyPool();

    player = Player(
        onPlayerHit: () {
          gameBloc.add(DecreaseLives());
        },
        bulletPool: bulletPool);
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

    final state = gameBloc.state;
    if (state.lives == 0 && player.isMounted) {
      player.onDeath();
    }
    if (state.status == GameStatus.gameOver &&
        !overlays.isActive('GameOverMenu')) {
      overlays.add('GameOverMenu');
    } else if (state.status == GameStatus.gameWon &&
        !overlays.isActive('GameWonMenu')) {
      overlays.add('GameWonMenu');
    } else if (state.status == GameStatus.playing &&
        overlays.isActive('GameOverMenu')) {
      overlays.remove('GameOverMenu');
    } else if (state.status == GameStatus.playing &&
        overlays.isActive('GameWonMenu')) {
      overlays.remove('GameWonMenu');
    }
  }

  void resetGame() {
    gameManager.resetGame();
    add(player);
    spawnEnemies(5);
  }
}
