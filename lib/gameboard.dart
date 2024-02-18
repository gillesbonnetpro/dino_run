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
    dinoYoffset = (52 / 472) * (height / 2);

    if (height > 952) {
      dinoYoffset = 52;
    }

    print('height : $height / offset : $dinoYoffset / diff : ${height - 952}');

    return Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          const Background(),
          Positioned(
            bottom: -dinoYoffset,
            child: Container(
              constraints: BoxConstraints(maxHeight: height / 2),
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
          )
        ]);
  }
}
