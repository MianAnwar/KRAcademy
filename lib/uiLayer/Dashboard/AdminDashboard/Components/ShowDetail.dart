import 'package:flutter/material.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({
    Key key,
    this.msg1,
    this.msg2,
    this.msg3 = "",
    this.msg4 = "",
    this.fsize = 17.0,
    this.fontName = "Ubuntu-Light",
  }) : super(key: key);
  final String msg1;
  final String msg2;
  final String msg3;
  final String msg4;
  final double fsize;
  final String fontName;

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.widget.msg1,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.fsize,
          ),
        ),
        Text(
          this.widget.msg2,
          style: TextStyle(
            color: Colors.white70,
            fontSize: widget.fsize,
            fontWeight: FontWeight.bold,
            fontFamily: widget.fontName,
          ),
        ),
        Text(
          this.widget.msg3,
          style: TextStyle(
            color: Colors.white70,
            fontSize: widget.fsize,
            fontWeight: FontWeight.bold,
            fontFamily: widget.fontName,
          ),
        ),
        Text(
          this.widget.msg4,
          style: TextStyle(
            color: Colors.white70,
            fontSize: widget.fsize,
            fontWeight: FontWeight.bold,
            fontFamily: widget.fontName,
          ),
        ),
      ],
    );
  }
}
