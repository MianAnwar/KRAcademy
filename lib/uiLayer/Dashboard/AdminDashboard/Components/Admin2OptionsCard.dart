import 'package:flutter/material.dart';

class Admin2OptionsCard extends StatelessWidget {
  const Admin2OptionsCard({
    Key key,
    this.name = "Attendence",
    this.option1 = "op1",
    this.option2 = "op2",
    this.nameFun,
    this.stFun,
    this.thrFun,
    this.fontName = "Ubuntu-Light",
  }) : super(key: key);

  final String name;
  final String option1;
  final String option2;
  final Function nameFun;
  final Function stFun;
  final Function thrFun;
  final String fontName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    Color textColor = Colors.white;
    Color cardColor = Colors.black45;
    Color btn1Color = Colors.indigo;
    Color btn2Color = Colors.blue;
    return Card(
      color: cardColor,
      elevation: 5.0,
      child: Column(
        children: [
          FlatButton(
            onPressed: this.nameFun,
            child: Text(
              this.name,
              style: TextStyle(
                color: textColor,
                fontSize: w * 0.056,
                fontFamily: fontName,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: this.stFun,
                  color: btn1Color,
                  child: Text(
                    this.option1,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.04,
                      fontFamily: fontName,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: this.thrFun,
                  color: btn2Color,
                  child: Text(
                    this.option2,
                    style: TextStyle(
                      color: textColor,
                      fontSize: w * 0.038,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontName,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
