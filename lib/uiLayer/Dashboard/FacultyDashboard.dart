import 'package:flutter/material.dart';
import 'package:kacademy/DataAccessLayer/LocalDB.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/HomeScreen/homeScreen.dart';

class FacultyDashboard extends StatefulWidget {
  @override
  _FacultyDashboardState createState() => _FacultyDashboardState();
}

class _FacultyDashboardState extends State<FacultyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.mPrimaryTextColor,
      body: Center(
        child: Text("Faculty Deshboard"),
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
