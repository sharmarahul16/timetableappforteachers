import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'formatters.dart';

//code for designing the UI of our text field where the user writes his email id or password

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

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

final _auth = FirebaseAuth.instance;

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late String useremail;
  late String user;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan[50],
        title: const Text(
          "FORGET PASSWORD",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.cyan[50],
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 80),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius:75.0,
                child: ClipRRect(
                  child: Image.asset('assets/tttl.png', height: 150, width: 120),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                    LowerCaseTextFormatter()
                  ],
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    useremail = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'EMAIL',
                      hintText: 'Enter your email')),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text('FORGOT PASSWORD', style: TextStyle(fontSize: 25.0)),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  setState(() {
                    FirebaseAuth.instance.sendPasswordResetEmail(email: useremail);
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen2(value: 'studentclass',)));
                    showSpinner = true;
                  });
                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
