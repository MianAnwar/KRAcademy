import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class SettingDTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Daily Test Setting"),
      body: Center(
        child: Text("Setting Daily Test!\nComing Soon..."),
      ),
    );
  }
}
