import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakins/command.dart';
import 'package:pakins/gameboard.dart';
import 'package:pakins/start.dart';

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
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
          future: loadImages(context),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? SafeArea(
                    child: Scaffold(
                      body: Command(
                        child: const GameBoard(),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}
