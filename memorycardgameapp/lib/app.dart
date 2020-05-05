import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/MainMenu.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Card Game',
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    );
  }
}