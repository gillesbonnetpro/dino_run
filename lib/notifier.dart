import 'package:flutter/material.dart';

final ValueNotifier<Direction> directionNotifier =
    ValueNotifier<Direction>(Direction.toRight);

final ValueNotifier<DinoAction> actionNotifier =
    ValueNotifier<DinoAction>(DinoAction.idle);

final ValueNotifier<int> velocityNotifier = ValueNotifier<int>(0);

enum Direction { toLeft, toRight }

enum DinoAction { idle, walk, run, jump }
