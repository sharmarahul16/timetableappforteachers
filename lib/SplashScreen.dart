import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignupScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? Key }) : super(key: Key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetosignupohome();
  }

  _navigatetosignupohome()async {
    FirebaseApp app = await Firebase.initializeApp();
    await Future.delayed(Duration(milliseconds: 4000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.redAccent]),
            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 180.0, vertical: 100.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:75.0,
                        child: ClipRRect(
                          child: Image.asset('assets/tttl.png', height: 150, width: 120),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text("Teacher Panel", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color:  Colors.black)),
                      Padding(
                        padding: EdgeInsets.only(top: 270.0),
                      ),
                      Text("TIME TABLE MANAGEMENT", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color:  Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
