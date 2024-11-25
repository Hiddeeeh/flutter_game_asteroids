enum GameStatus { playing, gameOver, gameWon}

class GameState {
  final int score;
  final int lives;
  final GameStatus status;

  GameState({
    required this.score,
    required this.lives,
    required this.status,
  });

  //initial game state
  factory GameState.initial() {
    return GameState(score: 0, lives: 3, status: GameStatus.playing);
  }

  //way to copy state and change certain fields
  GameState copyWith({int? score, int? lives, GameStatus? status}) {
    return GameState(
      score: score ?? this.score,
      lives: lives ?? this.lives,
      status: status ?? this.status,
    );
  }
}