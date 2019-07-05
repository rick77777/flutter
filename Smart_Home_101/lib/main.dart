import 'package:flutter/material.dart';
import 'Pages/Setup/MyItemsPage.dart';
import 'Pages/Setup/Temperature.dart';
import 'Pages/Setup/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var routes = <String,WidgetBuilder>{
    MyItemsPage.routeName: (BuildContext context) => new MyItemsPage(title: "My Items Page"),
    Temperature.routeName: (BuildContext context) => new Temperature(title: "Temperature Data"),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginPage(title: 'Sign In'),
      routes: routes,
    );
  }
}