import 'package:flutter/material.dart';
import 'package:kacademy/DataAccessLayer/LocalDB.dart';
import 'package:kacademy/Objects_Layer/StudentModel.dart';
import 'package:kacademy/Objects_Layer/TeacherModel.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminStdAED/AddPage/AddEditStdScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminStdAED/AllClasses.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminThrAED/AddEditThrScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminThrAED/AllTeachers.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminThrAED/DelEditTeacher.dart';
import 'package:kacademy/uiLayer/AdminPages/DailyTests/MarkDTestScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/DailyTests/SettingDTestScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/FeeSalary/AdminFeeScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/FeeSalary/AdminSalaryScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/MonthlyReport/ClassMonthlyReportScreen.dart';
import 'package:kacademy/uiLayer/AdminPages/MonthlyReport/StudentMonthlyReportScreen.dart';
import 'package:kacademy/uiLayer/HomeScreen/homeScreen.dart';
import 'Components/AdminOptionsCard.dart';
import 'Components/Admin2OptionsCard.dart';
import 'Components/MainPanel..dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      body: AdminBody(),
    );
  }
}

class AdminBody extends StatefulWidget {
  const AdminBody({
    Key key,
  }) : super(key: key);

  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //////// Main Panel ////////
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              color: Colors.black54,
              child: MainPanelAdminDashboard(),
            ),
            //////// Admin Options Panel ////////
            Row(
              children: [
                Expanded(
                  child: Admin2OptionsCard(
                    name: "Fee & Salary",
                    option1: "Fee",
                    option2: "Salary",
                    nameFun: null,
                    stFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminFeeScreen();
                          },
                        ),
                      );
                    },
                    thrFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminSalaryScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Admin2OptionsCard(
                    name: "Daily Tests",
                    option1: "Setting",
                    option2: "Mark",
                    stFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SettingDTestScreen();
                          },
                        ),
                      );
                    },
                    thrFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MarkDTestScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Admin2OptionsCard(
                    name: "Monthly Rep",
                    option1: "Class",
                    option2: "Student",
                    stFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ClassMonthlyReportScreen();
                          },
                        ),
                      );
                    },
                    thrFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StudentMonthlyReportScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Admin2OptionsCard(
                    name: "Attendence",
                    option1: "Students",
                    option2: "Teachers",
                    stFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllClasses(ProjectConstants.attendence);
                          },
                        ),
                      );
                    },
                    thrFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllTeachers();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AdminOptionsCard(
                    name: "Students",
                    nameFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllClasses(ProjectConstants.justShow);
                          },
                        ),
                      );
                    },
                    addFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddEditStdScreen(
                              headMsg: "Add  NEW",
                              std: new Student.instance(),
                            );
                          },
                        ),
                      );
                    },
                    editFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllClasses(ProjectConstants.edit);
                          },
                        ),
                      );
                    },
                    delFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllClasses(ProjectConstants.delete);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: AdminOptionsCard(
                    name: "Teachers",
                    nameFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AllTeachers();
                          },
                        ),
                      );
                    },
                    addFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AddEditThrScreen(
                              headMsg: "Add NEW",
                              thr: new Teacher.instance(),
                            );
                          },
                        ),
                      );
                    },
                    editFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DETeacher(
                              delOrEdit: "Edit",
                            );
                          },
                        ),
                      );
                    },
                    delFun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DETeacher(
                              delOrEdit: "Delete",
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: FlatButton(
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
                      color: Colors.indigo,
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: ProjectConstants.fontName,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
