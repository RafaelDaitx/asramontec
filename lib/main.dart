import 'package:asramon/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.lime),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}
