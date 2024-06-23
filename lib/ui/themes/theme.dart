import 'package:flutter/material.dart';

class MyAppTheme {
  static TextStyle errorTextStyle =
      const TextStyle(fontSize: 22, color: Colors.red);
  static List<ThemeData> themes = [
    ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.yellow),
      primaryColor: Colors.yellow,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 22, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 32, color: Colors.yellow),
        bodySmall: TextStyle(fontSize: 15, color: Colors.yellow),
      ),
      iconTheme: const IconThemeData(
        color: Colors.yellow,
      ),
    ),
    ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.teal),
      primaryColor: Colors.teal,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 22, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 32, color: Colors.teal),
        bodySmall: TextStyle(fontSize: 15, color: Colors.teal),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 35, 147, 96),
      ),
    ),
    ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.teal),
      primaryColor: Colors.blue,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 22, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 32, color: Colors.blue),
        bodySmall: TextStyle(fontSize: 15, color: Colors.blue),
      ),
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
    ),
    ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.teal),
      primaryColor: Colors.orange,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 22, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 32, color: Colors.orange),
        bodySmall: TextStyle(fontSize: 15, color: Colors.orange),
      ),
      iconTheme: const IconThemeData(
        color: Colors.orange,
      ),
    ),
  ];
}
