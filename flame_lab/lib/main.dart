import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'device_size_helper.dart';
import 'func_widget.dart';
import 'my_game.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyHomePage(),
    ),
    debugShowCheckedModeBanner: true,
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    Size size = view.physicalSize;
    size = view.physicalSize / view.devicePixelRatio;
    double dpWidth = size.width;
    double dpHeight = size.height;
    Size sizeIn916 = DeviceSizeHelper.getClosestSize(Size(dpWidth, dpHeight));
    return Center(
        child: Stack(children: [
      GameWidget(game: MyGame()),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(1.0),
            ),
            child: SizedBox(
                width: sizeIn916.width,
                height: (dpHeight - sizeIn916.height) / 2,
                child: const FuncWidget()),
          ),
        ],
      ),
    ]));
  }
}
