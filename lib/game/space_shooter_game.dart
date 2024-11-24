import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';


import 'bloc/player_bloc.dart';
import 'components/player.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  late Player player;
  late PlayerBloc playerBloc;

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
  }
}