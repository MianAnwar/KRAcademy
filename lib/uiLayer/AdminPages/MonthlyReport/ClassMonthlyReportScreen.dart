import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class ClassMonthlyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Monthly Report"),
      body: Center(
        child: Text("Class Monthly Report!\nComing Soon..."),
      ),
    );
  }
}
