import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_game/game/blocs/game_state.dart';

abstract class GameEvent {}

class InCreaseScore extends GameEvent {
  final int points;
  InCreaseScore(this.points);
}

class DecreaseLives extends GameEvent {}

class ResetGame extends GameEvent {}

class GameWon extends GameEvent {}

class GameOver extends GameEvent {}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.initial()){
  
  on<InCreaseScore>((event, emit) {
    final newScore = state.score + event.points;
    emit(state.copyWith(score: newScore));
  });

  on<DecreaseLives>((event, emit) {
    final newLives = state.lives - 1;
    if (newLives <= 0) {
      emit(state.copyWith(lives: 0, status: GameStatus.gameOver));
    } else {
      emit(state.copyWith(lives: newLives));
    }
  });

  on<ResetGame>((event, emit) {
    emit(GameState.initial());
  });

  on<GameWon>((event, emit) {
    emit(state.copyWith(status: GameStatus.gameWon));
  });

  on<GameOver>((event, emit) {
    emit(state.copyWith(status: GameStatus.gameOver));
  });

}

}