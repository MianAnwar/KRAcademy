import 'package:flutter/material.dart';
import 'Components/AdminButton.dart';
import 'Components/FacultyOrStudent.dart';
import 'Components/MainText.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.tt = "normal"});
  final String tt;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'assests/images/academy.png',
            width: size.width * 0.4,
            height: size.height * 0.4,
          ),

          // Sample Space
          MainText(),
          Center(child: Text(tt)),
          // Sample Space
          SizedBox(height: h * 0.03),
          FacultyOrStudent(),
          AdminButton(),

          // Sample Space
          SizedBox(height: h * 0.06),
          Text(
            "Login to proceed\n if don\'t have account then Contact Admin",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: h * 0.04),
        ],
      ),
    );
  }
}
