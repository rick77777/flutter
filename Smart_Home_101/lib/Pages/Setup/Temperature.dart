import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Temperature extends StatefulWidget {
  Temperature({Key key, this.title}) : super(key: key);

  static const String routeName = "/Temperature";

  final String title;

  @override
  _TemperatureState createState() => new _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  //final DatabaseReference _db = FirebaseDatabase().reference();
  final DatabaseReference _db = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: /*new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child:
          new Icon(Icons.brightness_high),
          //label: Text("TEMPERATURE"),
      ),*/
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text('View Record'),
              onPressed: () {
                getData();
              },
            ),
            /*child: StreamBuilder<Event>(
            stream: _db.child('smarthome').onValue,
            builder: (context, AsyncSnapshot<Event> snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              var allData = snapshot.data.snapshot.value;
              var senData = allData["Sensors"] as Map;

              return CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("SENSORS",
                          style: Theme
                              .of(context)
                              .textTheme
                              .display4,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((_, int index) {
                          return ListTile(
                            title: Text(senData.keys.toList()[index]),
                            onTap: () {},
                            leading: Text(senData.values.toList()[index]["Temperature"]
                                .toString()),
                            /*subtitle: Text(
                                dhtData.values.toList()[index]["humidity"]
                                    .toString()),*/
                            isThreeLine: true,
                          );
                        }, childCount: senData.length),
                      ),
                    ),
                  ]
              );
            }),*/
          ],
        ),
      ),
    );
  }

  void getData() {
    _db.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}