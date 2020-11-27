import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kacademy/DataAccessLayer/LocalDB.dart';
import 'package:kacademy/Logic_Layer/LogicLayerFunctionality.dart';
import 'package:kacademy/Objects_Layer/LoginCredentials.dart';
import 'package:kacademy/uiLayer/Dashboard/AdminDashboard/AdminDashboard.dart';
import 'package:kacademy/uiLayer/Dashboard/FacultyDashboard.dart';
import 'package:kacademy/uiLayer/Dashboard/StudentDashboard.dart';

class InputCredentials extends StatefulWidget {
  InputCredentials({
    Key key,
    this.loginOf,
  }) : super(key: key);
  final String loginOf;
  @override
  _InputCredentialsState createState() => _InputCredentialsState();
}

class _InputCredentialsState extends State<InputCredentials> {
  final _loginformKey = GlobalKey<FormState>();
  TextEditingController phoneNoCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  String phoneNo = "p";
  String pwd = "pd";
  String errorMsg = "";

  int phnoYes = -1;
  int pwdYes = -1;

  bool btn = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.05;
    double h = size.width * 0.07;
    double v = size.width * 0.04;
    return Form(
      key: _loginformKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: phoneNoTextFormField(),
              ),
              Expanded(
                child: phnoYes == 1
                    ? Icon(Icons.verified, color: Colors.white)
                    : phnoYes == 0
                        ? IconButton(
                            icon: Icon(Icons.close, color: Colors.black45),
                            onPressed: () {
                              setState(() {
                                phoneNoCtrl.text = "";
                              });
                            })
                        : Text(""),
              ),
            ],
          ),
          /////////////////////////////
          SizedBox(height: 10),
          /////////////////////////////
          Row(
            children: [
              Expanded(
                flex: 4,
                child: pwdTextFormField(),
              ),
              Expanded(
                child: pwdYes == 1
                    ? Icon(Icons.verified, color: Colors.white)
                    : pwdYes == 0
                        ? IconButton(
                            icon: Icon(Icons.close, color: Colors.black45),
                            onPressed: () {
                              setState(() {
                                pwdCtrl.text = "";
                              });
                            })
                        : Text(""),
              ),
            ],
          ),
          /////////////////////////////
          SizedBox(height: 50),
          /////////////////////////////
          FlatButton(
            onPressed: btn
                ? () {
                    setState(() {
                      if (_loginformKey.currentState.validate()) {
                        // proceed to verify from DB system
                        btn = false;
                        LoginCredentials cred = LoginCredentials(
                            this.phoneNo, this.pwd, this.widget.loginOf);
                        continueToLogin(cred);
                      }
                    });
                  }
                : null,
            splashColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
              side: BorderSide(color: Colors.white),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: fsize),
              ),
            ),
          ),
          !btn
              ? Padding(
                  padding: EdgeInsets.only(
                      top: 10, right: MediaQuery.of(context).size.width * 0.1),
                  child: LinearProgressIndicator(backgroundColor: Colors.white),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          /////////////////////////////
          //Text(this.phoneNo + ", " + this.pwd),
        ],
      ),
    );
  }

  Future<void> continueToLogin(LoginCredentials cred) async {
    final LogicLayerFunctionality llf = LogicLayerFunctionality();
    DBHelper dhHplr = DBHelper();
    var res = await llf.getVerifyLoginCredentials(cred);
    //if unsuccessfull to login
    if (res == 1) {
      setState(() {
        btn = true;
        errorMsg = "Incorrect Credentials.";
      });
    } else {
      // else continue to proceed to next dashboard page
      // 1st save
      await dhHplr.insertCredentials(cred);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return this.widget.loginOf == "Student"
              ? StudentDashboard()
              : this.widget.loginOf == "Faculty"
                  ? FacultyDashboard()
                  : AdminDashboard();
        }),
        (route) => false,
      );
    }
  }

  TextFormField pwdTextFormField() {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.05;
    double f2size = size.width * 0.036;
    return TextFormField(
      onChanged: (value) {
        setState(() {
          this.pwd = value;
        });
      },
      obscureText: true,
      controller: pwdCtrl,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            this.pwdYes = 0;
          });
          return "Must sepecify password!";
        }
        if (value.length < 6) {
          setState(() {
            this.pwdYes = 0;
          });
          return "Incorrect length.";
        }
        setState(() {
          this.pwdYes = 1;
        });
        return null;
      },
      style: TextStyle(color: Colors.white, fontSize: fsize),
      //-------------------------------------------------------------//
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      //-------------------------------------------------------------//
      decoration: InputDecoration(
        hintText: "Enter your Password",
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white54),
        errorStyle: TextStyle(color: Colors.black, fontSize: f2size),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1.5),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5),
        ),
      ),
      //-------------------------------------------------------------//
    );
  }

  TextFormField phoneNoTextFormField() {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.05;
    double f2size = size.width * 0.038;
    return TextFormField(
      onChanged: (value) {
        setState(() {
          this.phoneNo = value;
        });
      },
      controller: phoneNoCtrl,
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            this.phnoYes = 0;
          });
          return "Must sepecify your Phone Number!";
        }
        if (value.length != 11) {
          setState(() {
            this.phnoYes = 0;
          });
          return "Format: 03211234567";
        }
        setState(() {
          this.phnoYes = 1;
        });
        return null;
      },
      style: TextStyle(color: Colors.white, fontSize: fsize),
      //-------------------------------------------------------------//
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.phone,
      //-------------------------------------------------------------//
      decoration: InputDecoration(
        hintText: "03211234567",
        labelText: "Phone Number",
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white54),
        errorStyle: TextStyle(color: Colors.black, fontSize: f2size),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1.5),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5),
        ),
      ),
      //-------------------------------------------------------------//
    );
  }
}
