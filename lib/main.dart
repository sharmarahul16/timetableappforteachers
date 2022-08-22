// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:timetableappforteachers/ClassEighth.dart';
import 'package:timetableappforteachers/ClassNinth.dart';
import 'package:timetableappforteachers/ClassSeventh.dart';
import 'package:timetableappforteachers/ClassSixth.dart';
import 'package:timetableappforteachers/ClassTenth.dart';
import 'package:timetableappforteachers/ForgotPasswordScreen.dart';
import 'package:timetableappforteachers/LoginScreen.dart';
import 'package:timetableappforteachers/SplashScreen.dart';
import 'SignupScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash'  : (context) => SplashScreen(),
        'signup'  : (context) => SignupScreen(),
        'login'   : (context) => LoginScreen(),
        'forget'  : (context) => ForgotPasswordScreen(),
        'sixth'   : (context) => SixthClass(),
        'seventh' : (context) => SeventhClass(),
        'eighth'  : (context) => EighthClass(),
        'ninth'   : (context) => NinthClass(),
        'tenth'   : (context) => TenthClass()
      }
    );
  }
}