import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class DinoWalk extends StatefulWidget {
  DinoWalk({super.key});

  @override
  State<DinoWalk> createState() => _DinoWalkState();
}

class _DinoWalkState extends State<DinoWalk> {
  List<AssetImage> walk = [];
  int frame = 0;
  late Timer t;

  @override
  void initState() {
    for (var i = 1; i < 11; i++) {
      String walkName = 'assets/dino/Walk_$i.png';
      walk.add(AssetImage(walkName));
    }

    t = Timer.periodic(const Duration(milliseconds: 50), (timer) {
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
