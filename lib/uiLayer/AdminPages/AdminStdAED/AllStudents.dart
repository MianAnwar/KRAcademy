import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class AllStudents extends StatelessWidget {
  AllStudents({this.purpose, this.headMsg});
  final String purpose;
  final String headMsg;
  @override
  Widget build(BuildContext context) {
    int i = -1;
    var iconShow;
    if (purpose == ProjectConstants.attendence) {
      i = 1;
      iconShow = Icons.emoji_people_outlined;
    } else if (purpose == ProjectConstants.justShow) {
      i = 2;
      iconShow = Icons.directions;
    } else if (purpose == ProjectConstants.edit) {
      i = 3;
      iconShow = Icons.edit;
    } else if (purpose == ProjectConstants.delete) {
      i = 4;
      iconShow = Icons.delete;
    }
    i = i;
    //////////////Sample Data//////////////
    List<String> stds = [
      "Ali",
      "Akram",
      "Sufran",
      "Bilal",
      "Usama",
      "Haseeb",
      "Javed",
      "Abdullah",
      "Ahsan",
      "Anas"
    ];
    //////////////Sample Data//////////////

    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Class " + headMsg),
      body: Center(
        child: ListView.builder(
          itemCount: stds.length,
          itemBuilder: (context, i) {
            return Card(
              color: Colors.black12,
              child: ListTile(
                leading: Icon(Icons.open_with, color: Colors.white),
                title: Row(
                  children: [
                    Expanded(
                        child: Text(
                      stds[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName,
                          fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        child: Text(
                      "Science/Arts",
                      style: TextStyle(
                          color: Colors.white54,
                          fontFamily: ProjectConstants.fontName),
                    )),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    iconShow,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
