import 'package:flutter/material.dart';
import 'package:kacademy/Objects_Layer/StudentModel.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

import 'TextFormField.dart';

class AddEditStdScreen extends StatefulWidget {
  AddEditStdScreen({this.headMsg, this.std});
  final String headMsg;
  final Student std;

  @override
  _AddEditStdScreenState createState() => _AddEditStdScreenState();
}

class _AddEditStdScreenState extends State<AddEditStdScreen> {
  final _addformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;

    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, this.widget.headMsg),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: size.height * 0.7,
            width: double.infinity,
            color: Colors.black54,
            child: Form(
              key: _addformkey,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  StringTextFormField(
                    hintText: "Enter Full Name:",
                    labelText: "Full Name",
                    func: (String v) {
                      this.widget.std.fullName = v;
                    },
                  ),
                  StringTextFormField(
                    hintText: "Enter Father's Name:",
                    labelText: "Father's Name",
                    func: (String v) {
                      this.widget.std..fatherName = v;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "e.g: 9, 10, 11, 12",
                          labelText: "Class",
                          wantUpper: true,
                          upperLimit: 2,
                          max: true,
                          maxValue: 12,
                          func: (String v) {
                            this.widget.std.classStudy = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        flex: 2,
                        child: StringTextFormField(
                          hintText: "Science/Arts",
                          labelText: "Major Subject",
                          func: (String v) {
                            this.widget.std.majorSubject = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: NumberTextFormField(
                          hintText: "e.g: 16",
                          labelText: "Age",
                          wantUpper: true,
                          upperLimit: 2,
                          func: (String v) {
                            this.widget.std.age = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        flex: 2,
                        child: NumberTextFormField(
                          hintText: "3520212345678",
                          labelText: "CNIC/BForm",
                          want: true,
                          limit: 13,
                          func: (String v) {
                            this.widget.std.cnic = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: StringTextFormField(
                          hintText: "Male/Female",
                          labelText: "Gender",
                          func: (String v) {
                            this.widget.std.gender = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        flex: 2,
                        child: StringTextFormField(
                          hintText: "H#, Town, City, District",
                          labelText: "Current Address",
                          func: (String v) {
                            this.widget.std.currentAddress = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "03344345291",
                          labelText: "Guardian's contact No",
                          want: true,
                          limit: 11,
                          func: (String v) {
                            this.widget.std.fatherPhoneNo = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "03344345291",
                          labelText: "Alternative contact No",
                          want: true,
                          limit: 11,
                          func: (String v) {
                            this.widget.std.alternativePhoneNo = v;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              if (this._addformkey.currentState.validate()) {
                // proceed to save to DB system
                printTheNewStd();
                this.savetheNewStudent(); //this.newStd
              }
            },
            color: Colors.black45,
            splashColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
              side: BorderSide(color: Colors.white),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.03, vertical: size.height * 0.018),
              child: Text(
                "Press to " + this.widget.headMsg + " Student",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu-Light",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void savetheNewStudent() {}
  printTheNewStd() {
    print(this.widget.std.fullName);
    print(this.widget.std.fatherName);
    print(this.widget.std.classStudy);
    print(this.widget.std.age);
    print(this.widget.std.majorSubject);
    print(this.widget.std.cnic);
    print(this.widget.std.currentAddress);
    print(this.widget.std.gender);
    print(this.widget.std.fatherPhoneNo);
    print(this.widget.std.alternativePhoneNo);
  }
}
