import 'package:flutter/material.dart';

class AppStyle {
  static const double smallInsets = 8;
  static const double mediumInsets = 10;
  static const double largeInsets = 15;

  static const Color background = Color.fromARGB(255, 255, 242, 235);
  static Color primary = Colors.cyan;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color error = Colors.red;

  static const String oswaldFont = 'Oswald';
  static const String concertFont = 'Concert';

  static TextStyle headingStyle() {
    return const TextStyle(
      fontSize: 30,
      color: white,
      fontWeight: FontWeight.bold,
      fontFamily: oswaldFont,
    );
  }

  static TextStyle titleStyle() {
    return const TextStyle(
      fontSize: 18,
      color: black,
      fontWeight: FontWeight.w600,
      fontFamily: oswaldFont,
    );
  }

  static TextStyle errorStyle() {
    return const TextStyle(
      fontSize: 15,
      color: error,
      fontFamily: concertFont,
    );
  }

  static TextStyle noramlStyle() {
    return const TextStyle(
      fontSize: 15,
      color: black,
      fontFamily: concertFont,
    );
  }
}
