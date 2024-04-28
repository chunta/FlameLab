import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'my_game.dart';

void main() {
  runApp(
    SafeArea(child: GameWidget(game: MyGame())),
  );
}
