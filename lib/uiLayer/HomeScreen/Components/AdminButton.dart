import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/Login/LoginScreen.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    Key key,
  }) : super(key: key);

  void gotoLoginScreen(BuildContext context) {
    /////////////////////////////////
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen("Admin");
        },
      ),
      (route) => false,
    );
    /////////////////////////////////
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.06;
    double h = size.width * 0.05;
    double v = size.width * 0.04;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h),
      child: FlatButton(
        onPressed: () {
          gotoLoginScreen(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: ProjectConstants.m2BorderColor, width: 2.4),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            "Administration",
            style: TextStyle(
              fontSize: fsize,
              color: ProjectConstants.m2BorderColor,
            ),
          ),
        ),
      ),
    );
  }
}
