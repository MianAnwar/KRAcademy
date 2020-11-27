import 'package:flutter/material.dart';
import 'package:kacademy/Objects_Layer/TeacherModel.dart';
import 'package:kacademy/projectConstants.dart';
import 'package:kacademy/uiLayer/AdminPages/AdminStdAED/AddPage/TextFormField.dart';
import 'package:kacademy/uiLayer/AdminPages/buildAppBar.dart';

class AddEditThrScreen extends StatefulWidget {
  AddEditThrScreen({this.headMsg, this.thr});
  final String headMsg;
  final Teacher thr;

  @override
  _AddEditThrScreenState createState() => _AddEditThrScreenState();
}

class _AddEditThrScreenState extends State<AddEditThrScreen> {
  final _addformkey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController fathernameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController genderCtrl = TextEditingController();
  TextEditingController nicCtrl = TextEditingController();
  TextEditingController currAddressCtrl = TextEditingController();
  TextEditingController majorS1Ctrl = TextEditingController();
  TextEditingController majorS2Ctrl = TextEditingController();
  TextEditingController cls1Ctrl = TextEditingController();
  TextEditingController cls2Ctrl = TextEditingController();
  TextEditingController cls3Ctrl = TextEditingController();
  TextEditingController cls4Ctrl = TextEditingController();
  TextEditingController cnt1Ctrl = TextEditingController();
  TextEditingController cnt2Ctrl = TextEditingController();
  @override
  void initState() {
    nameCtrl.text = this.widget.thr.fullName;
    fathernameCtrl.text = this.widget.thr.fatherName;
    ageCtrl.text = this.widget.thr.age;
    genderCtrl.text = this.widget.thr.gender;
    nicCtrl.text = this.widget.thr.cnic;
    currAddressCtrl.text = this.widget.thr.currentaddress;
    majorS1Ctrl.text = this.widget.thr.majorsubject1;
    majorS2Ctrl.text = this.widget.thr.majorsubject2;
    cls1Ctrl.text = this.widget.thr.class1;
    cls2Ctrl.text = this.widget.thr.class2;
    cls3Ctrl.text = this.widget.thr.class3;
    cls4Ctrl.text = this.widget.thr.class4;
    cnt1Ctrl.text = this.widget.thr.contactno1;
    cnt2Ctrl.text = this.widget.thr.contactno2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;

    return Scaffold(
      backgroundColor: ProjectConstants.m2BorderColor,
      appBar: buildAddEditAppBar(context, this.widget.headMsg),
      body: ListView(
        children: [
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: size.height * 0.7,
            width: double.infinity,
            color: Colors.black54,
            child: Form(
              key: _addformkey,
              child: ListView(
                children: [
                  StringTextFormField(
                    hintText: "Enter Full Name:",
                    labelText: "Full Name",
                    ctrl: nameCtrl,
                    func: (String v) {
                      this.widget.thr.fullName = v;
                    },
                  ),
                  StringTextFormField(
                    hintText: "Enter Father Name:",
                    labelText: "Father's Name",
                    ctrl: fathernameCtrl,
                    func: (String v) {
                      this.widget.thr.fatherName = v;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "Enter student Age...",
                          labelText: "Age",
                          wantUpper: true,
                          upperLimit: 2,
                          ctrl: ageCtrl,
                          func: (String v) {
                            this.widget.thr.age = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: StringTextFormField(
                          hintText: "Male/Female",
                          labelText: "Gender",
                          ctrl: genderCtrl,
                          func: (String v) {
                            this.widget.thr.gender = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "Enter NIC No 13 digits",
                          labelText: "CNIC",
                          want: true,
                          limit: 13,
                          ctrl: nicCtrl,
                          func: (String v) {
                            this.widget.thr.cnic = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: StringTextFormField(
                          hintText: "H#, Town, City, District",
                          labelText: "Current Address",
                          ctrl: currAddressCtrl,
                          func: (String v) {
                            this.widget.thr.currentaddress = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: StringTextFormField(
                          hintText: "(Bio/Comp)",
                          labelText: "Major Subject 1",
                          ctrl: majorS1Ctrl,
                          func: (String v) {
                            this.widget.thr.majorsubject1 = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: StringTextFormField(
                          hintText: "(Chem/Maths)",
                          labelText: "Major Subject 2",
                          ctrl: majorS2Ctrl,
                          func: (String v) {
                            this.widget.thr.majorsubject2 = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "e.g: 9",
                          labelText: "Class 1",
                          wantUpper: true,
                          upperLimit: 2,
                          max: true,
                          maxValue: 12,
                          ctrl: cls1Ctrl,
                          func: (String v) {
                            this.widget.thr.class1 = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "e.g: 10",
                          labelText: "Class 2",
                          wantUpper: true,
                          upperLimit: 2,
                          max: true,
                          maxValue: 12,
                          ctrl: cls2Ctrl,
                          func: (String v) {
                            this.widget.thr.class2 = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "e.g: 11",
                          labelText: "Class 3",
                          wantUpper: true,
                          upperLimit: 2,
                          max: true,
                          maxValue: 12,
                          ctrl: cls3Ctrl,
                          func: (String v) {
                            this.widget.thr.class3 = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "e.g: 12",
                          labelText: "Class 4",
                          wantUpper: true,
                          upperLimit: 2,
                          max: true,
                          maxValue: 12,
                          ctrl: cls4Ctrl,
                          func: (String v) {
                            this.widget.thr.class4 = v;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "Cell No 03344345291",
                          labelText: "Contact No 1",
                          want: true,
                          limit: 11,
                          ctrl: cnt1Ctrl,
                          func: (String v) {
                            this.widget.thr.contactno1 = v;
                          },
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Expanded(
                        child: NumberTextFormField(
                          hintText: "Cell No 03344345291",
                          labelText: "Alternative contact No",
                          want: true,
                          limit: 11,
                          ctrl: cnt2Ctrl,
                          func: (String v) {
                            this.widget.thr.contactno2 = v;
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
                printTheNewthr();
                this.savetheNewTeacher(); //this.newthr
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
                "Press to " + this.widget.headMsg + " Record",
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

  void savetheNewTeacher() {}
  printTheNewthr() {
    print(this.widget.thr.fullName);
    print(this.widget.thr.fatherName);
    print(this.widget.thr.class1);
    print(this.widget.thr.class2);
    print(this.widget.thr.class3);
    print(this.widget.thr.class4);
    print(this.widget.thr.age);
    print(this.widget.thr.majorsubject1);
    print(this.widget.thr.majorsubject2);
    print(this.widget.thr.cnic);
    print(this.widget.thr.currentaddress);
    print(this.widget.thr.gender);
    print(this.widget.thr.contactno1);
    print(this.widget.thr.contactno2);
  }
}
