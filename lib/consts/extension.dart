import 'package:flutter/material.dart';

extension AppText on String {
  Widget appText(
      {required FontWeight fontWeight,
      Color color = Colors.black,
      required double size}) {
    return Text(
      this,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}

/// This is for sized box
extension AddSpace on num {
  Widget spaceH() {
    return SizedBox(height: toDouble());
  }

  Widget spaceW() {
    return SizedBox(width: toDouble());
  }
}
