import 'package:flame/game.dart';
import 'package:flutter_game/game/states/player_state.dart';
import 'bloc/player_bloc.dart';
import 'bloc/player_bloc_state.dart';
import 'components/player.dart';


class MyGame extends FlameGame {
  late Player player;
  late PlayerBloc playerBloc;

  @override
  Future<void> onLoad() async {
    playerBloc = PlayerBloc();

    //load playersprite
    final playerSprite = await loadSprite('player.png');
    player = Player(
      sprite: playerSprite,
      position: Vector2(100, 100),
      size: Vector2(50, 50),
    );
    add(player);

    //listen for changes in playerstate
    playerBloc.stream.listen((PlayerBlocState state) {
      if (state.lives <= 0) {
        player.changeState(DestroyedState());
      } else if (state.isShielded) {
        player.changeState(ShieldedState());
      } else {
        player.changeState(NormalState());
      }
    });
  }
}