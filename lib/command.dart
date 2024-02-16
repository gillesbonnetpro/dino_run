import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class Command extends StatefulWidget {
  Command({super.key, required this.child});

  Widget child;

  @override
  State<Command> createState() => _CommandState();
}

class _CommandState extends State<Command> {
  late double savedX;
  late double savedY;
  late double goFast;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    goFast = MediaQuery.of(context).size.width / 10;

    return GestureDetector(
        onPanStart: ((details) {
          setState(() {
            savedX = details.globalPosition.dx;
            savedY = details.globalPosition.dy;
          });
        }),
        onPanUpdate: ((details) async {
          // ****************************************
          // Déplacement latéral
          // ****************************************

          // update de la direction si besoin
          if (details.globalPosition.dx > (savedX + 30) &&
              directionNotifier.value == Direction.toLeft) {
            directionNotifier.value = Direction.toRight;
          } else if (details.globalPosition.dx < (savedX - 30) &&
              directionNotifier.value == Direction.toRight) {
            directionNotifier.value = Direction.toLeft;
          }

          velocityNotifier.value =
              (details.globalPosition.dx - savedX).abs().toInt();

          /*    print(
              'deltaX : ${details.globalPosition.dx} / saved $savedX / velocity ${velocityNotifier.value}');
           */
          actionNotifier.value = (velocityNotifier.value < goFast ||
                  actionNotifier.value == DinoAction.jump)
              ? DinoAction.walk
              : DinoAction.run;

          // ****************************************
          // Déplacement vertical
          // ****************************************

          print(
              'deltaY : ${details.globalPosition.dy} / saved $savedY / ${details.globalPosition.dy < (savedY - 30)}');

          if (details.globalPosition.dy < savedY - 30 &&
              actionNotifier.value != DinoAction.jump &&
              details.delta.dy < 0) {
            print('JUMP !');
            actionNotifier.value = DinoAction.jump;
            await Future.delayed(const Duration(milliseconds: 13 * 30));
            actionNotifier.value = (velocityNotifier.value < goFast)
                ? DinoAction.walk
                : DinoAction.run;

            if (velocityNotifier.value == 0) {
              actionNotifier.value = DinoAction.idle;
            }
          }

          /* else if (details.globalPosition.dx < (savedX - 30) &&
              directionNotifier.value == Direction.toRight) {
            directionNotifier.value = Direction.toLeft;
          } */
        }),
        onPanEnd: (details) async {
          // actionNotifier.value = DinoAction.jump;
          // await Future.delayed(const Duration(milliseconds: 500));
          int i = velocityNotifier.value;
          if (i > 500) {
            i = 500;
          }
          for (i; i > 0; i--) {
            await Future.delayed(const Duration(milliseconds: 1));
            velocityNotifier.value = i;
            actionNotifier.value = (velocityNotifier.value < goFast)
                ? DinoAction.walk
                : DinoAction.run;
          }
          velocityNotifier.value = 0;
          actionNotifier.value = DinoAction.idle;
        },
        child: SizedBox.expand(child: widget.child));
  }
}
