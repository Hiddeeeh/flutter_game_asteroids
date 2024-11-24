import 'package:equatable/equatable.dart';

class PlayerState extends Equatable{
  final int lives;
  final bool isShielded;

  PlayerState({
    required this.lives,
    this.isShielded = false,
  });

  PlayerState copyWith({int? lives, bool? isShielded}) {
    return PlayerState(
      lives: lives ?? this.lives,
      isShielded: isShielded ?? this.isShielded,
    );
  }
    @override
    List<Object?> get props => [lives, isShielded];

}