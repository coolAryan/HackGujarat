import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String user;
  String pswd;
  @override
  Widget build(BuildContext context) {
    // var fs = FirebaseFirestore.instance;
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
                  height: 90,
                  child: Text(
                    "Login",
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
                Text(
                  'Forgot Password?',
                  style: GoogleFonts.lato(
                      fontStyle: FontStyle.normal,
                      color: Colors.amberAccent.shade400),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  height: 65,
                  //minwidth: MediaQuery.of(context).size.width * 0.8,
                  minWidth: 198,
                  textColor: Colors.blue.shade400,
                  color: Colors.white,
                  onPressed: () async {
                    try {
                      var usr = await authc.signInWithEmailAndPassword(
                          email: user, password: pswd);
                      if (usr != null) {
                        Navigator.pushNamed(context, "/contentt");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.mcLaren(
                        fontSize: 28,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
