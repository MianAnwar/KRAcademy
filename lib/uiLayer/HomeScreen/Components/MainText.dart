import 'package:flutter/material.dart';
import 'package:kacademy/projectConstants.dart';

class MainText extends StatelessWidget {
  const MainText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    return Text(
      "Kamaran Academy\nScience & Commerce",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ProjectConstants.mPrimaryTextColor,
        fontSize: w * 0.10,
        fontFamily: ProjectConstants.startFontName,
      ),
    );
  }
}
