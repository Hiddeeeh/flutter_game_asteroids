

import 'package:flame/components.dart';

import '../components/bullet.dart';

class BulletPool {
  final List<Bullet> _pool = [];
  final int _initialSize;
  final int _maxSize;

  BulletPool({int initialSize = 20, int maxSize = 50})
    : _initialSize = initialSize,
    _maxSize = maxSize {
      for (var i =  0; i < _initialSize; i++) {
        _pool.add(Bullet(Vector2.zero())..active = false);
      }
    }

    Bullet? getBullet(Vector2 position, Vector2 direction) {
      for (final bullet in _pool) {
        if (!bullet.active) {
          bullet.reset(position, direction);
          bullet.active = true;
          return bullet;
        }
      }

      if (_pool.length < _maxSize) {
        final newBullet = Bullet(position)..active = true;
        _pool.add(newBullet);
        return newBullet;
      }

      throw Exception('bullet pool exhausted');
    }

    void releaseBullet(Bullet bullet) {
      bullet.active = false;
    }
}