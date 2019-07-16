import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Setup/MyItemsPage.dart';
import 'Setup/welcome.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Drawer drawer = new Drawer();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Column(mainAxisSize: MainAxisSize.min,
          children:
          <Widget>[
            Text ('WELCOME !', textScaleFactor: 3.5),
            Text(' '),
            Text('Signed in as ${widget.user.email}', textScaleFactor: 1.5),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyItemsPage.routeName);
                },
                child: Text('PRESS ME'),
           ),
          )
        ],
      ),
    ),
   );
  }
}
