import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({
    this.loginOf,
  });

  final String loginOf;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.1;
    double h = size.width * 0.05;
    double v = size.width * 0.08;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: Text(
        loginOf + ", Welcome Back!",
        style: TextStyle(
            fontSize: fsize, color: ProjectConstants.mySecondTextColor),
      ),
    );
  }
}
