import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class PlayerHitEvent extends PlayerEvent {

}

class PlayerPowerupEvent extends PlayerEvent {

}

class PlayerResetEvent extends PlayerEvent {
  
}