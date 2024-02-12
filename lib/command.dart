import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class Command extends StatefulWidget {
  const Command({
    super.key,
  });

  @override
  State<Command> createState() => _CommandState();
}

class _CommandState extends State<Command> {
  late double posX;
  late Color pointColor;
  late bool isMoving;

  @override
  void initState() {
    isMoving = false;
    pointColor = Colors.amber.shade900;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    posX = 0;

    return Container(
        height: 50,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTapDown: (details) {
                directionNotifier.value = Direction.toLeft;
                actionNotifier.value = DinoAction.run;
              },
              onTapUp: (details) {
                actionNotifier.value = DinoAction.idle;
              },
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: pointColor,
              ),
            ),
            GestureDetector(
              onTapDown: (details) {
                directionNotifier.value = Direction.toLeft;
                actionNotifier.value = DinoAction.walk;
              },
              onTapUp: (details) {
                actionNotifier.value = DinoAction.idle;
              },
              child: Icon(
                Icons.arrow_circle_left_rounded,
                color: pointColor,
              ),
            ),
            GestureDetector(
              onTapDown: (details) {
                directionNotifier.value = Direction.toRight;
                actionNotifier.value = DinoAction.walk;
              },
              onTapUp: (details) {
                actionNotifier.value = DinoAction.idle;
              },
              child: Icon(
                Icons.arrow_circle_right_rounded,
                color: pointColor,
              ),
            ),
            GestureDetector(
              onTapDown: (details) {
                directionNotifier.value = Direction.toRight;
                actionNotifier.value = DinoAction.run;
              },
              onTapUp: (details) {
                actionNotifier.value = DinoAction.idle;
              },
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: pointColor,
              ),
            ),
          ],
        ));
  }
}
