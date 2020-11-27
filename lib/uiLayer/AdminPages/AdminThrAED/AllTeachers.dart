import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class AllTeachers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsize = size.width * 0.1;
    //////////////Sample Data//////////////
    List<String> teacherNames = [
      "KauKab",
      "Hamaza",
      "Kamran",
      "Nauman",
      "Anwar"
    ];
    List<String> subjects = ["Chem", "Comp", "Math", "Phy", "Comp"];
    //////////////Sample Data//////////////

    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, "Teachers"),
      body: Center(
        child: ListView.builder(
          //stream Builder will be here for live changes
          itemCount: teacherNames.length,
          itemBuilder: (context, i) {
            return Card(
              color: Colors.black12,
              child: ListTile(
                leading: Icon(Icons.open_with, color: Colors.white),
                title: Row(
                  children: [
                    Expanded(
                        child: Text(
                      teacherNames[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName,
                          fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                        child: Text(
                      subjects[i],
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName),
                    )),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white38,
                    size: iconsize,
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
