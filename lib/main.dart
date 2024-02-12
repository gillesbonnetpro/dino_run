import 'package:flutter/material.dart';
import 'package:pakins/background.dart';
import 'package:pakins/command.dart';
import 'package:pakins/dino_idle.dart';
import 'package:pakins/dino_walk.dart';
import 'package:pakins/gameboard.dart';
import 'package:pakins/notifier.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GameBoard(),
            ),
            Command()
          ],
        ),
      ),
    );
  }
}
