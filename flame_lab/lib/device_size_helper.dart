import 'package:flutter/material.dart';

class DeviceSizeHelper {
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height *
            MediaQuery.of(context).devicePixelRatio +
        kToolbarHeight +
        kBottomNavigationBarHeight;
  }

  static Size getClosestSize(Size sizeA) {
    double aspectRatio = 9 / 16;
    double width = sizeA.width;
    double height = sizeA.height;

    double newWidth = width;
    double newHeight = newWidth / aspectRatio;

    if (newHeight > height) {
      newHeight = height;
      newWidth = newHeight * aspectRatio;
    }

    return Size(newWidth, newHeight);
  }
}
