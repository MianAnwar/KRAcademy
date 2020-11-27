import 'package:flutter/material.dart';
import 'package:kacademy/Objects_Layer/TeacherModel.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

import 'AddEditThrScreen.dart';

class DETeacher extends StatelessWidget {
  DETeacher({
    this.delOrEdit,
  });
  final String delOrEdit;

  @override
  Widget build(BuildContext context) {
    bool edit = true;
    var iconOption;
    if (this.delOrEdit.contains("Delete")) {
      edit = false;
      iconOption = Icons.delete;
    } else if (this.delOrEdit.contains("Edit")) {
      iconOption = Icons.edit;
      edit = true;
    }
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
      appBar: buildAddEditAppBar(context, delOrEdit + " Teachers"),
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
                    iconOption,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (edit) {
                      continueToEdit(
                        context,
                        new Teacher(
                          teacherNames[i],
                          "FatherName",
                          "21",
                          "Chem",
                          "Bio",
                          "9",
                          "10",
                          "11",
                          "12",
                          "3520202323333",
                          "lhr",
                          "male",
                          "03103345678",
                          "03344345695",
                        ),
                      );
                    } else {
                      continueToDelete();
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void continueToEdit(BuildContext context, Teacher t) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddEditThrScreen(
            headMsg: "Edit  Teacher",
            thr: t,
          );
        },
      ),
    );
  }

  void continueToDelete() {}
}
