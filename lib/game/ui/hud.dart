

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game_bloc.dart';
import '../blocs/game_state.dart';

class HUD extends StatelessWidget {
  const HUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Score: ${state.score}', style: const TextStyle(fontSize: 20, color: Colors.white)),
                Text('Lives: ${state.lives}', style: const TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}