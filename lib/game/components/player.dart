

import 'package:flame/components.dart';
import 'package:flutter_game/game/states/player_state.dart';

class Player extends SpriteComponent {
  double speed = 300;
  int lives = 3;
  late PlayerState currentState;

  Player({
    required Sprite sprite,
    required Vector2 position,
    required Vector2 size,
  }) : super(sprite: sprite, position: position, size: size) {
    currentState = NormalState(); //start in the normal state
    currentState.enterState(this);
  }

  @override
  void update(double dt) {
    super.update(dt);
    currentState.update(this, dt);
  }

  void onCollision() {
    currentState.onCollision(this);
  }

  //method for changing state (being called in player_state)
  void changeState(PlayerState newState) {
    currentState = newState;
    currentState.enterState(this);
  }
}