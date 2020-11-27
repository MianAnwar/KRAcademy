import 'package:flutter/material.dart';
import 'package:kacademy/DataAccessLayer/LocalDB.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/HomeScreen/homeScreen.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.mPrimaryColor,
      body: Center(
        child: Text("Student Deshboard"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          DBHelper dhHplr = DBHelper();
          await dhHplr.deleteCredentials();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }),
            (route) => false,
          );
        },
        label: Text(
          "Logout",
          style: TextStyle(fontFamily: ProjectConstants.fontName),
        ),
      ),
    );
  }
}
