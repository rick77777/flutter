import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Drawer drawer = new Drawer();
    return Scaffold(drawer: drawer,
      appBar : AppBar(
        title: Text('Welcome Page !!')
      )
    );
  }
}
