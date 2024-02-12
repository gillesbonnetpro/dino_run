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
            IconButton(
              onPressed: () {
                directionNotifier.value = Direction.toLeft;
              },
              icon: Icon(
                Icons.arrow_circle_left_rounded,
                color: pointColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_circle_up_rounded,
                color: pointColor,
              ),
            ),
            IconButton(
              onPressed: () {
                directionNotifier.value = Direction.toRight;
              },
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                color: pointColor,
              ),
            ),
          ],
        ));
  }
}
