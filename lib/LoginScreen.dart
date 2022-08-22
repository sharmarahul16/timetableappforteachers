import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:timetableappforteachers/ClassTenth.dart';
import 'ForgotPasswordScreen.dart';
import 'SignupScreen.dart';
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

class LoginScreen extends StatefulWidget {
  late final String value;
  LoginScreen({Key? key, required this.value}) : super (key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late List detail;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name    = TextEditingController();
  final TextEditingController _email    = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late String username;
  late String useremail;
  late String userpassword;
  late TextEditingController controller;
  bool isButtonActive = true;
  bool showSpinner = false;

  final CollectionReference teacherdetails =
  FirebaseFirestore.instance.collection('teacherdetails');

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan[50],
        title: const Text(
          "LOGIN SCREEN",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  onChanged: (value) {
                   userpassword= value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'PASSWORD',
                      hintText: 'Enter your Password')),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              }, child: const Text('Forgot Password',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              ),
              const SizedBox(
                height: 2,
              ),
              FlatButton(
                child: Text('LOGIN', style: TextStyle(fontSize: 25.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  setState(() {
                    isButtonActive = false;
                    showSpinner = true;
                  });
                   try {
                      final user = await _auth.signInWithEmailAndPassword(email: useremail, password: userpassword);
                      if (user != null) {
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("User LoggedIn Successfully"),
                      ));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TenthClass()));
                      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
                        if (user == null) {
                          print('User is currently signed out!');
                        } else {
                          print('User is signed in!');
                        }
                      });
                    } catch (e) {}
                }
              ),
              Row(
                children: <Widget>[
                  const Text('Dont have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                    },
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