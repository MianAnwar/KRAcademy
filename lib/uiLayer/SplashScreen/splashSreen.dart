import 'package:flutter/material.dart';
import 'package:kacademy/DataAccessLayer/LocalDB.dart';
import 'package:kacademy/Logic_Layer/LogicLayerFunctionality.dart';
import 'package:kacademy/Objects_Layer/LoginCredentials.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/Dashboard/AdminDashboard/AdminDashboard.dart';
import 'package:kacademy/uiLayer/Dashboard/FacultyDashboard.dart';
import 'package:kacademy/uiLayer/Dashboard/StudentDashboard.dart';
import 'package:kacademy/uiLayer/HomeScreen/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LogicLayerFunctionality llf = LogicLayerFunctionality();

  void whereTogo() async {
    DBHelper dhHplr = DBHelper();
    int count = await dhHplr.getCount();
    if (count == 0) {
      // simple go to HomeScreen
      moveToHome();
    } else if (count >= 1) {
      //there is saved credentials in Local DB      //phoneNo, pwd, who
      LoginCredentials cred = await dhHplr.getloginCredentials();
      //now login secretly with this cred
      var res = await llf.getVerifyLoginCredentials(cred);

      if (res == 1) //if unsuccessfull to login
      {
        moveToHome(
            msg:
                "\t\tClear App Storage!\nSome Problem with Login credentials.");
      } else {
        // else continue to proceed to next dashboard page
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return cred.who == "Admin"
                ? AdminDashboard()
                : cred.who == "Faculty"
                    ? FacultyDashboard()
                    : cred.who == "Student"
                        ? StudentDashboard()
                        : HomeScreen(tt: cred.who);
          }),
          (route) => false,
        );
      }
    } else {
      moveToHome(
          msg: "There is abnormality with Local DB, must contact developer.");
    }
  }

  void moveToHome({String msg}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return msg == null ? HomeScreen() : HomeScreen(tt: msg);
        },
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    // initialize Database
    whereTogo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        */
        // child: Center(
        //   child: Image.asset('assests/images/logo.png'),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Kamran Academy\nScience & Commerce",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ProjectConstants.mPrimaryTextColor,
                  fontSize: 40,
                  fontFamily: ProjectConstants.startFontName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text.rich(
                  TextSpan(
                    text: "Special for ",
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                    children: [
                      TextSpan(
                        text: "Primary, Middle, Matric, Inter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
