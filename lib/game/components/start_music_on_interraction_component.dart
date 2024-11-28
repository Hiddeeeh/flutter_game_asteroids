

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/services.dart';

class StartMusicOnInterractionComponent extends Component with KeyboardHandler {
  bool musicStarted = false;

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    startMusic();
    return false;
  }

  void startMusic() {
    if (!musicStarted) {
      FlameAudio.bgm.play('background_music.mp3', volume: 0.5);
      musicStarted = true;
      removeFromParent();
    }
  }

}