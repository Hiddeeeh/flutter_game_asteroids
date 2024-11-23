import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/player.dart';

class SpaceShooterGame extends FlameGame with HasKeyboardHandlerComponents {
  late Player player;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();

    add(player);
  }
}