import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';


import 'bloc/player_bloc.dart';
import 'components/enemy.dart';
import 'components/player.dart';
// import 'managers/enemy_manager.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  late Player player;
  late PlayerBloc playerBloc;
  // late EnemyManager enemyManager;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('background_layer1.png'),
        ParallaxImageData('background_layer2.png'),
        ParallaxImageData('background_layer3.png'),
        ParallaxImageData('background_layer4.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );

    add(parallax);

    playerBloc = PlayerBloc();
    player = Player();

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
        random.nextDouble() * size.y,);
      add(Enemy(position));
    }
  }
}