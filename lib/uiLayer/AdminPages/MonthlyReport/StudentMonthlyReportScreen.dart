import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class StudentMonthlyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Student Report"),
      body: Center(
        child: Text("Student Monthly Report!\nComing Soon..."),
      ),
    );
  }
}
