


// import 'package:flame/components.dart';
// import 'package:flutter_game/game/space_shooter_game.dart';
// import 'package:flutter_game/game/strategies/enemy_strategy.dart';

// import '../components/enemy.dart';

// class EnemyManager extends Component with HasGameRef<SpaceShooterGame>{
//   final List<Enemy> enemies = [];
//   final double spawninterval = 2.0;
//   double timeSinceLastSpawn = 0.0;

//   @override
//   void update(double dt) {
//     super.update(dt);

//     timeSinceLastSpawn += dt;
//     if (timeSinceLastSpawn >= spawninterval) {
//       spawnEnemy();
//       timeSinceLastSpawn = 0;
//     }

//     for (var enemy in enemies) {
//       enemy.update(dt);
//     }
//   }

//   void spawnEnemy() async {
//     final enemyType = LinearMovementStrategy();
//     final sprite = await gameRef.loadSprite('enemy.png');
//     final enemy = Enemy(
//       sprite: sprite, 
//       position: Vector2(
//         50.0 + (enemies.length * 70) % 300, -50 ), size: Vector2(50, 50), strategy: enemyType);
    
//     enemies.add(enemy);
//     add(enemy);
//   }
  
// }