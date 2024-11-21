import '../components/player.dart';

//setup base abstract class for the playerstate
abstract class PlayerState {
  void enterState (Player player);
  void update(Player player, double dt);
  void onCollision(Player player);
}

//Define normal state
class NormalState extends PlayerState {
  @override
  void enterState (Player player) {
    player.speed = 300;
  }

  @override
  void update(Player player, double dt) {
    //update logic here.
  }

  @override
  void onCollision(Player player) {
    player.lives -= 1;
    if(player.lives <= 0) {
      player.changeState(DestroyedState());//Go to destroyed state
    }
  }
}

//already setting up for shield powerup
class ShieldedState extends PlayerState {
  
  @override
  void enterState(Player player) {
    //idk yet, but for now lets make the player faster
    player.speed = 350;
  }

  @override
  void update(Player player, double dt) {
    //shield logic here (shield visual effects etc.)
  }

  @override
  void onCollision(Player player) {
    player.changeState(NormalState());//if shielded the player doesnt lose life.
  }
}

class DestroyedState extends PlayerState {

  @override
  void enterState(Player player) {
    
    player.speed = 0;
  }

  @override
  void update (Player player, double dt) {
    //death animation or something
  }

  @override
  void onCollision (Player player) {
    //nothing, the player is already dead.
  }
}



