import 'package:bloc/bloc.dart';

import 'player_event.dart';
import 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState(lives: 3));

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is PlayerHitEvent) {
      int updatedLives = state.lives -1;
      if (updatedLives <= 0) {
        //go to player destroyed state
      }
      yield state.copyWith(lives: updatedLives);
    }
  if (event is PlayerPowerupEvent) {
    //get shield
    yield state.copyWith(isShielded: true);
  }
  if (event is PlayerResetEvent) {
    //reset player
    yield PlayerState(lives: 3);
  }
  }  
}
