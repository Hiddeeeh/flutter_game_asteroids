import 'package:flame/game.dart';
import 'components/player.dart';


class MyGame extends FlameGame {
  late Player player;

  @override
  Future<void> onLoad() async {
    final playerSprite = await loadSprite('player.png');
    player = Player(
      sprite: playerSprite,
      position: Vector2(100, 100),
      size: Vector2(50, 50),
    );
    add(player);
  }


}