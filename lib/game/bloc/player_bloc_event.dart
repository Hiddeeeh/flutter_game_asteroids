import 'package:equatable/equatable.dart';

//lets define some events
abstract class PlayerBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PlayerHitEvent extends PlayerBlocEvent {}

class PlayerPowerUpEvent extends PlayerBlocEvent {}

class PlayerResetEvent extends PlayerBlocEvent {}