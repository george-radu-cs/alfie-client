import 'package:flutter/material.dart';

enum ThemeColor {
  blue,
  red,
  green,
  yellow,
  orange,
  purple,
  pink,
  white,
}

extension ThemeColorString on String {
  ThemeColor get toThemeColor {
    switch (this) {
      case "blue":
        return ThemeColor.blue;
      case "red":
        return ThemeColor.red;
      case "green":
        return ThemeColor.green;
      case "yellow":
        return ThemeColor.yellow;
      case "orange":
        return ThemeColor.orange;
      case "purple":
        return ThemeColor.purple;
      case "pink":
        return ThemeColor.pink;
      case "white":
        return ThemeColor.white;
      default:
        return ThemeColor.blue;
    }
  }
}

extension ThemeColorExtension on ThemeColor {
  Color get toColor {
    switch (this) {
      case ThemeColor.blue:
        return Colors.blueAccent;
      case ThemeColor.red:
        return Colors.redAccent;
      case ThemeColor.green:
        return Colors.greenAccent.shade700;
      case ThemeColor.yellow:
        return Colors.yellowAccent.shade700;
      case ThemeColor.orange:
        return Colors.orangeAccent;
      case ThemeColor.purple:
        return Colors.purpleAccent;
      case ThemeColor.pink:
        return Colors.pinkAccent;
      case ThemeColor.white:
        return Colors.white;
      default:
        return Colors.blueAccent;
    }
  }
}

extension ThemeColorExtension1 on Color {
  ThemeColor get toThemeColor {
    Colors.white == Colors.white;
    if (this == Colors.blueAccent) {
      return ThemeColor.blue;
    } else if (this == Colors.redAccent) {
      return ThemeColor.red;
    } else if (this == Colors.greenAccent.shade700) {
      return ThemeColor.green;
    } else if (this == Colors.yellowAccent.shade700) {
      return ThemeColor.yellow;
    } else if (this == Colors.orangeAccent) {
      return ThemeColor.orange;
    } else if (this == Colors.purpleAccent) {
      return ThemeColor.purple;
    } else if (this == Colors.pinkAccent) {
      return ThemeColor.pink;
    } else if (this == Colors.white) {
      return ThemeColor.white;
    } else {
      return ThemeColor.blue;
    }
  }
}
