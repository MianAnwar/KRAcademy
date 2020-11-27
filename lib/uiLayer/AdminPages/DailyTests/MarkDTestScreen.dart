import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class MarkDTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Daily Test"),
      body: Center(
        child: Text("Mark Daily Test!\nComing Soon..."),
      ),
    );
  }
}
