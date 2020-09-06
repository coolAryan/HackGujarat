import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:mapp/search.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  // @override
  // bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    var cp = CameraPosition(
        target: LatLng(26.937447, 75.836614), zoom: 12, tilt: 50);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        actions: [
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => MySearch()));
            },
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: cp,
        mapType: MapType.hybrid,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: lw, child: Icon(Icons.location_searching)),
    );
  }

  lw() {
    print("hi");
  }
}
