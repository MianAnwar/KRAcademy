import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

import 'AllStudents.dart';

class AllClasses extends StatelessWidget {
  AllClasses(this.purpose);
  final String purpose;
  @override
  Widget build(BuildContext context) {
    //                                   //
    //////////////Sample Data//////////////
    List<String> cls = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12"
    ];
    List<String> stds = [
      "12",
      "22",
      "15",
      "12",
      "14",
      "12",
      "22",
      "15",
      "12",
      "14",
      "23",
      "3"
    ];
    //////////////Sample Data//////////////
    ///                                 //

    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Classes"),
      body: Center(
        child: ListView.builder(
          itemCount: cls.length,
          itemBuilder: (context, i) {
            return Card(
              color: Colors.black12,
              child: ListTile(
                leading: Icon(Icons.open_with, color: Colors.white),
                title: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Class  " + cls[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName,
                          fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        child: Text(
                      stds[i] + "-Students",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName),
                    )),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AllStudents(
                            purpose: this.purpose,
                            headMsg: i.toString(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
