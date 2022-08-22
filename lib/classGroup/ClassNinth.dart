import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ClassEighth.dart';
import 'ClassSeventh.dart';
import '../ClassSixth.dart';
import '../ClassTenth.dart';
import '../LoginScreen.dart';

void main() {runApp(NinthClass());}

class NinthClass extends StatefulWidget {
  const NinthClass({ Key? key}) : super(key: key);

  @override
  _NinthClassState createState()=> _NinthClassState();
}

class _NinthClassState extends State<NinthClass> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "NINTH CLASS",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Sixth'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Seventh'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('Eighth'),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('Ninth'),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text('Tenth'),
                ),
                PopupMenuItem<int>(
                  value: 5,
                  child: Text('SignOut'),
                ),
              ]
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.symmetric(horizontal: 12),child: Text('',style: TextStyle(color:Colors.white,fontSize:20))),
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.all(5),child: Text('Mon',style: TextStyle(color:Colors.white,fontSize:20))),
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.all(5),child: Text('Tue',style: TextStyle(color:Colors.white,fontSize:20))),
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.symmetric(horizontal: 4),child: Text('Wed',style: TextStyle(color:Colors.white,fontSize:20))),
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.symmetric(horizontal: 1),child: Text('Thu',style: TextStyle(color:Colors.white,fontSize:20))),
                  Container(margin:EdgeInsets.all(10),padding: EdgeInsets.symmetric(horizontal: 1),child: Text('Fri',style: TextStyle(color:Colors.white,fontSize:20))),
                ],
              ),
              GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('9:00',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('Maths',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.deepOrange[300],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('History',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.yellowAccent[200],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('Hindi',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.green[300],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('English',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.red[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Computer',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('10:00',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.purple[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Science',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.purple[200],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('Science',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.green[300],borderRadius: BorderRadius.circular(5)),child: Column(children: [Text('English',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.yellowAccent[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Hindi',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('11:00',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.red[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Computer',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.green[300],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('English',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.yellowAccent[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Hindi',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('12:00',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.deepOrange[300],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('History',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.green[300],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('English',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.purple[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Science',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.green[300],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('English',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('1:30',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Maths',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.red[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Computer',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Maths',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                  Container(decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(5)), child: Column(children: [Text('Maths',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))])),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:6, mainAxisSpacing:2, crossAxisSpacing:2,childAspectRatio: 0.50),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch(item) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SixthClass()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeventhClass()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EighthClass()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NinthClass()));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TenthClass()));
        break;
      case 5:
        _auth.signOut();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(value: '',)));
        break;
    }
  }
}