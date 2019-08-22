import 'package:estoque/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/bottom-nav-bar.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle de Estoque',
      home: BottomNavBar(),
    );
  }
}
