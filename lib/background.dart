import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pakins/notifier.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late double posX;
  late double posY;
  late Timer t;

  @override
  void initState() {
    posY = 0;
    posX = 0;

    t = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (actionNotifier.value == DinoAction.walk) {
        if (directionNotifier.value == Direction.toRight) {
          posX += 5;
          if (posX > MediaQuery.of(context).size.width) {
            print('${MediaQuery.of(context).size.width} / posX');
            posX = MediaQuery.of(context).size.width * -0.1;
          }
        }

        if (directionNotifier.value == Direction.toLeft) {
          posX -= 5;
          if (posX < MediaQuery.of(context).size.width * -0.7) {
            posX = MediaQuery.of(context).size.width;
          }
        }
        setState(() {
          print('actu nuage $posX $posY');
        });
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    posX = MediaQuery.of(context).size.width;
    posY = MediaQuery.of(context).size.width * -0.9;
    print('change');
    super.didChangeDependencies();
  }

  void setX(DinoAction action) {
    double mvt = action == DinoAction.walk ? 5 : 10;
    setState(() {
      if (directionNotifier.value == Direction.toLeft) {
        posX = posX + mvt;
      } else {
        posX = posX - mvt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        const Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/panorama.jpg'),
        ),
        Positioned(
          right: posX,
          bottom: -50,
          child: SizedBox(
            width: MediaQuery.of(context).size.height * 0.5,
            child: const Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/arbre.png'),
            ),
          ),
        ),
      ],
    );
  }
}
