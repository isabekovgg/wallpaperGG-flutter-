import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperGG',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Home(),
    );
  }
}

