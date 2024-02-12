import 'package:flutter/material.dart';

final ValueNotifier<Direction> directionNotifier =
    ValueNotifier<Direction>(Direction.toRight);

enum Direction { toLeft, toRight }

enum Action { idle, walk, jump }
