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
  late double dinoYoffset;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print('height : $height');

    if (height < 500) {
      dinoYoffset = (height / 10) + (height / 200);
    } else {
      dinoYoffset = 50;
    }

    return Stack(fit: StackFit.expand, children: [
      const Background(),
      Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: Offset(0, dinoYoffset),
          child: ValueListenableBuilder<DinoAction>(
            builder: (BuildContext context, DinoAction action, Widget? child) {
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
      )
    ]);
  }
}
