import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class DinoJump extends StatefulWidget {
  DinoJump({super.key});

  @override
  State<DinoJump> createState() => _DinoJumpState();
}

class _DinoJumpState extends State<DinoJump> {
  List<AssetImage> walk = [];
  late Timer t;
  int frame = 0;
  double jumpHeight = 0;
  double savedTime = 0;

  @override
  void initState() {
    for (var i = 1; i < 13; i++) {
      String walkName = 'assets/dino/Jump_$i.png';
      walk.add(AssetImage(walkName));
    }

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      savedTime += 0.03;

      setState(() {
        if (frame + 1 > walk.length - 1) {
          frame = 0;
        } else {
          frame++;
        }
        jumpHeight = -10 * savedTime * savedTime + 5 * savedTime;
        if (jumpHeight < 0) {
          jumpHeight = 0;
        } else {
          jumpHeight *= MediaQuery.of(context).size.height / 2;
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('jump $jumpHeight');
    return Transform.translate(
      offset: Offset(0, -jumpHeight),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(
            directionNotifier.value == Direction.toLeft ? math.pi : 0),
        child: Image(
          image: walk[frame],
        ),
      ),
    );
  }
}