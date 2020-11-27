import 'package:flutter/material.dart';

class AdminOptionsCard extends StatelessWidget {
  const AdminOptionsCard({
    Key key,
    this.name = "Students",
    this.nameFun,
    this.addFun,
    this.editFun,
    this.delFun,
    this.fontName = "Ubuntu-Light",
  }) : super(key: key);

  final String name;
  final Function nameFun;
  final Function addFun;
  final Function editFun;
  final Function delFun;
  final String fontName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double cfsize = w * 0.028;
    Color textColor = Colors.white;
    Color cardColor = Colors.black45;
    Color btn1Color = Colors.indigo;
    Color btn2Color = Colors.blue;
    Color btn3Color = Colors.indigoAccent;
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
                  onPressed: this.addFun,
                  color: btn1Color,
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: textColor,
                      fontSize: cfsize,
                      fontWeight: FontWeight.bold,
                      fontFamily: fontName,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: this.editFun,
                  color: btn2Color,
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: textColor,
                      fontSize: w * 0.034,
                      fontFamily: fontName,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: this.delFun,
                  color: btn3Color,
                  child: Text(
                    "Del",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: cfsize,
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
