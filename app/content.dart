import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import './location.dart';

class MyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
      const StaggeredTile.count(2, 3),
      const StaggeredTile.count(1, 2),
      const StaggeredTile.count(1, 2),
      const StaggeredTile.count(2, 1),
      const StaggeredTile.count(3, 2),
    ];

    List<Widget> _tiles = <Widget>[
      GestureDetector(
        child: _Example01Tile(Colors.green, Icons.memory),
      ),
      _Example01Tile(Colors.lightBlue, Icons.bluetooth),
      _Example01Tile(Colors.amber, Icons.camera),
      GestureDetector(
        child: _Example01Tile(Colors.brown, Icons.location_on),
        onTap: () {
          Navigator.pushNamed(context, "/srch");
        },
      ),
      _Example01Tile(Colors.deepOrange, Icons.battery_alert_sharp),
    ];

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: new Container(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 3,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 35.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(2.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class MyContent extends StatefulWidget {
//   @override
//   _MyContentState createState() => _MyContentState();
// }

// class _MyContentState extends State<MyContent> {
//   @override
//   Widget build(BuildContext context) {

//     return Container(

//     );
//   }
// }
