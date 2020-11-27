import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/HomeScreen/homeScreen.dart';
import 'Components/LoginBody.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen(this.loginOf);
  final String loginOf;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var pushAndRemoveUntil = Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
          (route) => false,
        );
        return pushAndRemoveUntil;
      },
      child: Scaffold(
        backgroundColor: ProjectConstants.m2BorderColor,
        appBar: loginAppBar(context),
        body: LoginBody(widget.loginOf),
      ),
    );
  }

  AppBar loginAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        "L o g i n",
        style: TextStyle(fontSize: 50.0, fontFamily: "Signatra"),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          gotoHomeScreen(context);
        },
      ),
    );
  }

  void gotoHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
      (route) => false,
    );
  }
}
