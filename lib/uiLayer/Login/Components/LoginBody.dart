import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'LoginformCredentials.dart';
import 'WelcomeBack.dart';

class LoginBody extends StatefulWidget {
  LoginBody(this.loginOf);
  final String loginOf;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//    double fsize = size.width * 0.06;
    double h = size.width * 0.05;
    double v = size.width * 0.04;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WelcomeBack(loginOf: this.widget.loginOf),
          //------------------------------------------------------------------//
          Center(
            child: Container(
              color: ProjectConstants.m2bBorderColor,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
              child: InputCredentials(loginOf: this.widget.loginOf),
            ),
          ),
          //------------------------------------------------------------------//

          SizedBox(height: h),
          Center(
            child: Text(
              "Login to proceed\n if don\'t have account then Contact Admin\n if you forget your Password then contact Admin",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
