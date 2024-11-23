import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

class Player extends SpriteComponent with KeyboardHandler, HasGameRef<SpaceShooterGame> {

  Player() : super(
    size: Vector2(100, 100),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('player.png');

    position = gameRef.size / 2;
  }
  
  final Vector2 velocity = Vector2.zero();
  double speed = 200;
  int horizontalDirection = 0;
  int verticalDirection = 0;


  //keyboard input
  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      horizontalDirection = 0;
      verticalDirection = 0;
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) || keysPressed.contains(LogicalKeyboardKey.keyA)) {
        if (horizontalDirection >= 0) {
         horizontalDirection -= 1;
        }
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) || keysPressed.contains(LogicalKeyboardKey.keyD)) {
        if (horizontalDirection <= 0) {
         horizontalDirection += 1;
        }
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp) || keysPressed.contains(LogicalKeyboardKey.keyW)) {
        if (verticalDirection >= 0) {
         verticalDirection -= 1;
        }
      } 
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown) || keysPressed.contains(LogicalKeyboardKey.keyS)) {
        if (verticalDirection <= 0) {
         verticalDirection += 1;
        }
      }
    }
    return true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    velocity.x = horizontalDirection * speed;
    velocity.y = verticalDirection * speed;
    position += velocity * dt;
  }
}