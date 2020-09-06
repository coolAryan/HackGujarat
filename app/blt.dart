import 'package:flutter/material.dart';
//import 'package:flutter_blue/flutter_blue.dart';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text("SCAN"),
              color: Colors.blue,
            ),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ],
          title: Text("Bletooth Terminal HC-05"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.laptop,
                  ),
                  Text(
                    "Paired Devices",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              ListView(
                children: [
                  Container(
                    child: Text(""),
                  ),
                  Container(
                    child: Text(""),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
