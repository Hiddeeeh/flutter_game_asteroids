


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/game_bloc.dart';

class GameOverMenu extends StatelessWidget{
  final Function onRestart;

  const GameOverMenu({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Game Over', style: TextStyle(fontSize: 30)),
          ElevatedButton(
            onPressed: () {
              //reset the game
              context.read<GameBloc>().add(ResetGame());
              onRestart();
            }, 
            child: const Text('Restart')
          ),
        ],
      ),
    );
  }
}