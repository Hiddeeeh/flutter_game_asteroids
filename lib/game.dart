

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game/game/space_shooter_game.dart';

import 'game/blocs/game_bloc.dart';
import 'game/overlays/game_over_menu.dart';
import 'game/overlays/game_won_menu.dart';
import 'game/ui/hud.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    final spaceShooterGame = SpaceShooterGame(gameBloc: gameBloc);

    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: spaceShooterGame,
            overlayBuilderMap: {
              'GameOverMenu': (context, SpaceShooterGame gameRef) {
                return GameOverMenu(onRestart: gameRef.resetGame);
              },
              'GameWonMenu': (context, SpaceShooterGame gameRef) {
                return GameWonMenu(onRestart: gameRef.resetGame);
              },
              'HUD': (context, SpaceShooterGame gameRef) {
                return HUD();
              },
            },
            initialActiveOverlays: ['HUD'],)
        ],
      ),
    );
  }
}