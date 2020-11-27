import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/Login/LoginScreen.dart';

class FacultyOrStudent extends StatelessWidget {
  const FacultyOrStudent({
    Key key,
  }) : super(key: key);

  void gotoLoginScreen(BuildContext context, String loginOf) {
    /////////////////////////////////
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginScreen(loginOf);
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                gotoLoginScreen(context, "Student");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              color: ProjectConstants.m2BorderColor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("Student",
                    style: TextStyle(
                      fontSize: fsize,
                      color: ProjectConstants.mySecondTextColor,
                    )),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: FlatButton(
              onPressed: () {
                gotoLoginScreen(context, "Faculty");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
                side: BorderSide(color: ProjectConstants.m2BorderColor),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("Faculty",
                    style: TextStyle(
                      fontSize: fsize,
                      color: ProjectConstants.m2BorderColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
