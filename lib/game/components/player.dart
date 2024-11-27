import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/game/managers/bullet_pool.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

import 'bullet.dart';

class Player extends SpriteComponent
    with KeyboardHandler, HasGameRef<SpaceShooterGame> {
  final Function onPlayerHit;
  final double speed = 200;
  Vector2 velocity = Vector2.zero();
  final BulletPool bulletPool;

  final double shootingCooldown = 0.3;
  double timeSinceLastShot = 0.0;

  Player({required this.onPlayerHit, required this.bulletPool})
      : super(size: Vector2.all(50.0));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('player.png');

    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);

    timeSinceLastShot += dt;

    position += velocity * dt;
    //make shure the player wont go off screen
    position.clamp(Vector2.zero(), gameRef.size - size);
  }

  //keyboard input
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocity = Vector2.zero();
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
        keysPressed.contains(LogicalKeyboardKey.keyA)) {
      velocity.x = -speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
        keysPressed.contains(LogicalKeyboardKey.keyD)) {
      velocity.x = speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
        keysPressed.contains(LogicalKeyboardKey.keyW)) {
      velocity.y = -speed;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown) ||
        keysPressed.contains(LogicalKeyboardKey.keyS)) {
      velocity.y = speed;
    }

    if (keysPressed.contains(LogicalKeyboardKey.space)) {
      fireBullet();
    }

    return true;
  }

  void fireBullet() {
    if (timeSinceLastShot >= shootingCooldown) {
      final bullet = bulletPool.getBullet(
          position + Vector2(size.x / 2 - 5, -10), Vector2(0, -1));
      if (bullet != null) {
        bullet.reset(position + Vector2(size.x / 2 - bullet.size.x / 2, -10),
            Vector2(0, -1));
        FlameAudio.play('laser.mp3', volume: 0.8);
        gameRef.add(bullet);

        //reset cooldowntimer
        timeSinceLastShot = 0.0;
      }
    }
  }
}
