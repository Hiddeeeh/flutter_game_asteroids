import 'package:equatable/equatable.dart';

//lets define some states
class PlayerBlocState extends Equatable {
  final int lives;
  final bool isShielded;

  PlayerBlocState({
    required this.lives,
    this.isShielded = false,
  });

  //method to copy the state with modifications
  PlayerBlocState copyWith({int? lives, bool? isShielded}) {
    return PlayerBlocState(
      lives: lives ?? this.lives,
      isShielded: isShielded ?? this.isShielded,
    );
  }

  @override
  List<Object?> get props => [lives, isShielded];
}