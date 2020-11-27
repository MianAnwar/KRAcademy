import 'package:flutter/material.dart';

AppBar buildAddEditAppBar(BuildContext context, String headMsg) {
  Size size = MediaQuery.of(context).size;
  double fsize = size.width * 0.13;

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      headMsg,
      style: TextStyle(fontSize: fsize, fontFamily: "Signatra"),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: size.width * 0.08,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
