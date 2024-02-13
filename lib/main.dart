import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakins/command.dart';
import 'package:pakins/gameboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
// Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      home: Scaffold(
        body: Command(
          child: GameBoard(),
        ),
      ),
    );
  }
}
