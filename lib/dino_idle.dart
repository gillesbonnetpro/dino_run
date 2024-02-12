import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class DinoIdle extends StatefulWidget {
  DinoIdle({super.key});

  @override
  State<DinoIdle> createState() => _DinoIdleState();
}

class _DinoIdleState extends State<DinoIdle> {
  List<AssetImage> idle = [];
  int frame = 0;
  late Timer t;

  @override
  void initState() {
    for (var i = 1; i < 11; i++) {
      String idleName = 'assets/dino/Idle_$i.png';
      idle.add(AssetImage(idleName));
    }

    t = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (frame + 1 > idle.length - 1) {
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
        image: idle[frame],
      ),
    );
  }
}
