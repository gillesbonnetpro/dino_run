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

  @override
  void initState() {
    posY = 100;
    posX = 0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    posX = MediaQuery.of(context).size.width;
    print('change');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (actionNotifier.value == DinoAction.walk) {
      switch (directionNotifier.value) {
        case Direction.toLeft:
          print('direction left');
          posX++;
        case Direction.toRight:
          print('direction droite');
          posX--;
      }
    }

    print('$posX / $posY');
    return Transform.translate(
        offset: Offset(posX, posY),
        child: const Image(image: AssetImage('assets/nuage.jpg')));
  }
}
