import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringTextFormField extends StatelessWidget {
  const StringTextFormField({
    Key key,
    this.ctrl,
    this.hintText,
    this.labelText,
    this.func,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String hintText;
  final String labelText;
  final Function func;
  final String fontname = "Ubuntu-Light";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double f2size = size.width * 0.035;
    double f3size = size.width * 0.042;
    double fsize = size.width * 0.05;

    return TextFormField(
      onChanged: func,
      validator: (value) {
        if (value.isEmpty) {
          return "Must fill this field!";
        }
        if (value.length < 3) {
          return "incorrect input!";
        }

        return null;
      },
      cursorColor: Colors.grey,
      controller: ctrl,
      style:
          TextStyle(color: Colors.white, fontSize: fsize, fontFamily: fontname),
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.labelText,
        labelStyle: TextStyle(color: Colors.white70, fontSize: f3size),
        hintStyle: TextStyle(color: Colors.white54, fontSize: f3size),
        errorStyle: TextStyle(color: Colors.yellow, fontSize: f2size),
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
    );
  }
}

class NumberTextFormField extends StatelessWidget {
  const NumberTextFormField({
    Key key,
    this.ctrl,
    this.hintText,
    this.labelText,
    this.limit = 3,
    this.want = false,
    this.wantUpper = false,
    this.upperLimit = 0,
    this.max = false,
    this.maxValue = 0,
    this.func,
  }) : super(key: key);
  final TextEditingController ctrl;

  final String hintText;
  final String labelText;
  final Function func;
  final int limit;
  final bool want;
  final bool wantUpper;
  final int upperLimit;
  final bool max;
  final int maxValue;
  final String fontname = "Ubuntu-Light";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fsize = size.width * 0.05;
    double f2size = size.width * 0.038;

    return TextFormField(
      onChanged: func,
      cursorColor: Colors.grey,
      controller: ctrl,
      validator: (value) {
        if (value.isEmpty) {
          return "Must fill it!";
        }
        if (want) {
          if (value.length != this.limit) {
            return "incorrect input!";
          }
        }
        if (wantUpper) {
          if (value.length > this.upperLimit) {
            return "Not a Correct Input!";
          }
        }
        if (max) {
          if (int.parse(value) > maxValue) {
            return "InCorrect Input!";
          }
        }

        return null;
      },
      style:
          TextStyle(color: Colors.white, fontSize: fsize, fontFamily: fontname),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.labelText,
        labelStyle: TextStyle(color: Colors.white70, fontSize: f2size),
        hintStyle: TextStyle(color: Colors.white54, fontSize: f2size),
        errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: f2size),
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
    );
  }
}
