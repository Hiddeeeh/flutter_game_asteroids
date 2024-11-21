import 'package:bloc/bloc.dart';
import 'player_bloc_event.dart';
import 'player_bloc_state.dart';

class PlayerBloc extends Bloc<PlayerBlocEvent, PlayerBlocState> {
  PlayerBloc() : super(PlayerBlocState(lives: 3));

  @override
  Stream<PlayerBlocState> mapEventToState(PlayerBlocEvent event) async*{
    if(event is PlayerHitEvent) {
      //collision happens
      int updatedLives = state.lives -1;
      if (updatedLives <= 0) {
        //go to destroy state,
      } else if (event is PlayerPowerUpEvent) {
        //get shield
        yield state.copyWith(isShielded: true);
      } else if (event is PlayerResetEvent) {
        //reset that state
        yield PlayerBlocState(lives: 3);
      }
    }
  }
}