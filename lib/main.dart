import 'package:flutter/material.dart';
import 'package:pakins/command.dart';
import 'package:pakins/dino_idle.dart';
import 'package:pakins/dino_walk.dart';
import 'package:pakins/notifier.dart';

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
                child: ValueListenableBuilder<DinoAction>(
                  builder:
                      (BuildContext context, DinoAction action, Widget? child) {
                    switch (action) {
                      case DinoAction.idle:
                        return DinoIdle();
                      case DinoAction.walk:
                        return DinoWalk();
                      case DinoAction.jump:
                        return Placeholder();
                    }
                  },
                  valueListenable: actionNotifier,
                ),
              ),
            ),
            Command()
          ],
        ),
      ),
    );
  }
}
