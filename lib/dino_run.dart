import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class DinoRun extends StatefulWidget {
  DinoRun({super.key});

  @override
  State<DinoRun> createState() => _DinoRunState();
}

class _DinoRunState extends State<DinoRun> {
  List<AssetImage> walk = [];
  int frame = 0;
  late Timer t;

  @override
  void initState() {
    for (var i = 1; i < 9; i++) {
      String walkName = 'assets/dino/Walk_$i.png';
      walk.add(AssetImage(walkName));
    }

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        if (frame + 1 > walk.length - 1) {
          frame = 0;
        } else {
          frame++;
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
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(
          directionNotifier.value == Direction.toLeft ? math.pi : 0),
      child: Image(
        image: walk[frame],
      ),
    );
  }
}
