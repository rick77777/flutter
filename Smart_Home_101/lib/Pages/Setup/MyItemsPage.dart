import 'package:flutter/material.dart';

import 'Temperature.dart';

class MyItemsPage extends StatefulWidget {
  MyItemsPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/MyItemsPage";

  final String title;

  @override
  _MyItemsPageState createState() => new _MyItemsPageState();
}

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    var button = new IconButton(icon: new Icon(Icons.add_alert), onPressed: _onButtonPressed);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
          children: <Widget>[
            button,
          ]
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.pushNamed(context, Temperature.routeName);
  }
}

