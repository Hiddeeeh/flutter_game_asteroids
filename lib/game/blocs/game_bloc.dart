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
  GameBloc() : super(GameState.initial());

  @override
  // ignore: override_on_non_overriding_member
  Stream<GameState> mapEventToState(GameEvent event) async*{
    if (event is InCreaseScore) {
      yield state.copyWith(score: state.score + event.points);
    } else if (event is DecreaseLives) {
      final newLives = state.lives - 1;
      if (newLives <= 0) {
        yield state.copyWith(lives: 0, status: GameStatus.gameOver);
      } else {
        yield state.copyWith(lives: newLives);
      }
    } else if (event is ResetGame) {
      yield GameState.initial();
    } else if (event is GameWon) {
      yield state.copyWith(status: GameStatus.gameWon);
    } else if (event is GameOver) {
      yield state.copyWith(status: GameStatus.gameOver);
    }
  }
}

