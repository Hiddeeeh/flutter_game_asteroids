import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/player.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final playerSprite = await loadSprite('player.png');
    player = Player()
      ..sprite = playerSprite
      ..position = Vector2(100, 100)
      ..x = size.x / 2
      ..y = size.y / 2
      ..anchor = Anchor.center;

      add(player);
  }
}