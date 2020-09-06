import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  String user;
  String pswd;
  @override
  Widget build(BuildContext context) {
    var authc = FirebaseAuth.instance;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: 600,
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
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Text(
                    "Register",
                    style: GoogleFonts.indieFlower(
                        fontSize: 60, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 400,
                  padding: EdgeInsets.all(30.0),
                  child: TextField(
                    onChanged: (value) => user = value,
                    decoration: InputDecoration(
                      labelText: "UserName",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      )),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'aryan123@gmail.com',
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  padding: EdgeInsets.all(30.0),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) => pswd = value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                FlatButton(
                    //minwidth: MediaQuery.of(context).size.width * 0.8,
                    minWidth: 198,
                    textColor: Colors.blue.shade400,
                    color: Colors.white,
                    onPressed: () async {
                      try {
                        var usr = await authc.createUserWithEmailAndPassword(
                            email: user, password: pswd);
                        if (usr != null) {
                          Navigator.pushNamed(context, "/logint");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Submit')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
