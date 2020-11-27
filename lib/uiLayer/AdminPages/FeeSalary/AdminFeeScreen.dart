import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class AdminFeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Fee"),
      body: ListOfStudents(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ProjectConstants.m2BorderColor,
        elevation: 10,
        onPressed: () {},
        label: Text(
          "Defaulter's List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ListOfStudents extends StatelessWidget {
  const ListOfStudents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.black12,
            child: ListTile(
              leading: Icon(Icons.open_with, color: Colors.white),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Stdents  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Paid/UnPaid  ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: ProjectConstants.fontName,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
