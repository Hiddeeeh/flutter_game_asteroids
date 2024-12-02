

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../space_shooter_game.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef<SpaceShooterGame> {
  Explosion({required Vector2 position})
    :super(position: position, size: Vector2.all(64.0), removeOnFinish: true);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'smoke_explosion.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: .1,
        textureSize: Vector2.all(64),
        loop: false)
    );
  }
}