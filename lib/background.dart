import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late double arbreX;
  late double arbreY;
  late double buissonX;
  late double buissonY;
  late Timer t;

  @override
  void initState() {
    arbreY = 0;
    arbreX = 0;

    buissonX = 0;
    buissonY = 0;

    t = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      double factor = 0;
      if (actionNotifier.value == DinoAction.walk) {
        print('marche');
        factor = 8;
      } else if (actionNotifier.value == DinoAction.run) {
        print('court');
        factor = 20;
      }

      if (directionNotifier.value == Direction.toRight) {
        arbreX += factor;
        if (arbreX > MediaQuery.of(context).size.width) {
          arbreX = -(MediaQuery.of(context).size.width / 2);
        }
        buissonX += factor * 1.2;
        if (buissonX > MediaQuery.of(context).size.width) {
          buissonX = -(MediaQuery.of(context).size.width / 4);
        }
      }

      if (directionNotifier.value == Direction.toLeft) {
        arbreX -= factor;
        if (arbreX < -(MediaQuery.of(context).size.width / 2)) {
          arbreX = MediaQuery.of(context).size.width;
        }
        buissonX -= factor * 1.2;
        if (buissonX < -(MediaQuery.of(context).size.width / 4)) {
          buissonX = MediaQuery.of(context).size.width;
        }
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    arbreX = MediaQuery.of(context).size.width;
    buissonX = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/panorama.jpg'),
          ),
          Positioned(
            right: arbreX,
            bottom: -70,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/arbre.png'),
              ),
            ),
          ),
          Positioned(
            right: buissonX,
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: const Image(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/buisson.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
