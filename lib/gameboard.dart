import 'package:flutter/material.dart';
import 'package:pakins/background.dart';
import 'package:pakins/dino_idle.dart';
import 'package:pakins/dino_jump.dart';
import 'package:pakins/dino_run.dart';
import 'package:pakins/dino_walk.dart';
import 'package:pakins/notifier.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Background(),
        Transform.translate(
          offset: const Offset(0, 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<DinoAction>(
              builder:
                  (BuildContext context, DinoAction action, Widget? child) {
                switch (action) {
                  case DinoAction.idle:
                    return DinoIdle();
                  case DinoAction.walk:
                    return DinoWalk();
                  case DinoAction.jump:
                    return DinoJump();
                  case DinoAction.run:
                    return DinoRun();
                }
              },
              valueListenable: actionNotifier,
            ),
          ),
        ),
      ],
    );
  }
}
