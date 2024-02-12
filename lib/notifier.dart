import 'package:flutter/material.dart';

final ValueNotifier<Direction> directionNotifier =
    ValueNotifier<Direction>(Direction.toRight);

final ValueNotifier<DinoAction> actionNotifier =
    ValueNotifier<DinoAction>(DinoAction.idle);

enum Direction { toLeft, toRight }

enum DinoAction { idle, walk, run, jump }
