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
          });
        }),
        onPanUpdate: ((details) {
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
          actionNotifier.value = velocityNotifier.value < goFast
              ? DinoAction.walk
              : DinoAction.run;
        }),
        onPanEnd: (details) async {
          // actionNotifier.value = DinoAction.jump;
          await Future.delayed(const Duration(milliseconds: 500));
          velocityNotifier.value = 0;
          actionNotifier.value = DinoAction.idle;
        },
        child: SizedBox.expand(child: widget.child));
  }
}
