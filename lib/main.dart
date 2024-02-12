import 'package:flutter/material.dart';
import 'package:pakins/command.dart';
import 'package:pakins/dino_idle.dart';
import 'package:pakins/dino_walk.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DinoWal(),
              ),
            ),
            Command()
          ],
        ),
      ),
    );
  }
}
