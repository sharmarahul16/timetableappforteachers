import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'LoginScreen.dart';
import 'formatters.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.black),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name     = TextEditingController();
  final TextEditingController _email    = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm  = TextEditingController();
  final _auth      = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final CollectionReference teacherdetail =
  FirebaseFirestore.instance.collection('teacherdetail');

  late String username;
  late String useremail;
  late String userpassword;
  late String userconfirmpassword;
  late TextEditingController controller;
  late User loggedInUser;
  bool isButtonActive     = true;
  bool showSpinner        = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    _name     .dispose();
    _email    .dispose();
    _password .dispose();
    _confirm  .dispose();
    super.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        if (kDebugMode) {
          print(loggedInUser.email);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan[50],
        title: const Text(
          "SIGNUP SCREEN",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 10,
      ),
      backgroundColor: Colors.cyan[50],
      body: ModalProgressHUD(
        key: _formKey,
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 30),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius:75.0,
                child: ClipRRect(
                  child: Image.asset('assets/tttl.png', height: 150, width: 120),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter, UpperCaseTextFormatter()],
                  textAlign: TextAlign.start,
                  controller: _name,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'NAME',
                      hintText: 'Enter your name')),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter, LowerCaseTextFormatter()],
                  textAlign: TextAlign.start,
                  controller: _email,
                  onChanged: (value) {
                    useremail = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'EMAIL',
                      hintText: 'Enter your email')),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.start,
                  controller: _password,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                  onChanged: (value) {
                    userpassword = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'PASSWORD',
                      hintText: 'Enter your Password')),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.start,
                  controller: _confirm,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                  onChanged: (value) {
                    userconfirmpassword = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'CONFIRM',
                      hintText: 'Confirm your Password')),
              const SizedBox(
                height: 30.0,
              ),
              FlatButton(
                child: Text('REGISTER', style: TextStyle(fontSize: 25.0),),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  Map<String,String> detail = {
                    "studentName"  : username,
                    "studentemail" : useremail,
                  };
                  if (userpassword == userconfirmpassword) {
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(email: useremail, password: userpassword).then((value) {
                        _firestore.collection('teacherdetail').doc(value.user!.uid).set(detail);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User Registered Successfully"),
                      ));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(value: '')));
                    } catch (e) {}
                    setState(() {
                      showSpinner = false;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Incorrect Password"),
                    ));
                  }
                },
              ),
              Row(
                children: <Widget>[
                  const Text('Already have account?'),
                  TextButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20,color: Colors.blueAccent),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(value: '',)));
                    }
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}