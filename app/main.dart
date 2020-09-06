//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_bin/location.dart';
import './content.dart';
import './login.dart';
import './reg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyApp(),
        "/logint": (context) => MyLogin(),
        "/contentt": (context) => MyContent(),
        "/regt": (context) => MyReg(),
        "/srch": (context) => MyGoogleMap(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String user;
  String pswd;
  @override
  Widget build(BuildContext context) {
    // var fs = FirebaseFirestore.instance;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              child: Icon(
                Icons.arrow_upward_sharp,
                size: 50,
              ),
              backgroundColor: Colors.amberAccent.shade200,
              radius: 40,
            ),
            color: Colors.white,
          ),
          Container(
            height: 600,
            width: 900,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade200,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Smart-Tracker",
                    style: GoogleFonts.indieFlower(
                        fontSize: 60, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  width: 200,
                  height: 50,
                  //padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text(
                      "Register",
                      style: GoogleFonts.mcLaren(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      try {
                        Navigator.pushNamed(context, "/regt");
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Colors.amberAccent.shade400,
                    shape: new ContinuousRectangleBorder(
                      borderRadius: new BorderRadius.circular(8),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    child: Text(
                      "Login",
                      style: GoogleFonts.mcLaren(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/logint");
                    },
                    color: Colors.amberAccent.shade400,
                    shape: new ContinuousRectangleBorder(
                      borderRadius: new BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
