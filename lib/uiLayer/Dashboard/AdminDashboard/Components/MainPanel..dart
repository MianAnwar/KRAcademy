import 'package:flutter/material.dart';

import 'ShowDetail.dart';

class MainPanelAdminDashboard extends StatefulWidget {
  const MainPanelAdminDashboard({
    Key key,
  }) : super(key: key);

  @override
  _MainPanelAdminDashboardState createState() =>
      _MainPanelAdminDashboardState();
}

class _MainPanelAdminDashboardState extends State<MainPanelAdminDashboard> {
  String dayName() {
    return DateTime.now().weekday == 1
        ? "Monday"
        : DateTime.now().weekday == 2
            ? "Tusday"
            : DateTime.now().weekday == 3
                ? "Wednessday"
                : DateTime.now().weekday == 4
                    ? "Thursday"
                    : DateTime.now().weekday == 5
                        ? "Friday"
                        : DateTime.now().weekday == 6
                            ? "Saturday"
                            : DateTime.now().weekday == 7
                                ? "Sunday"
                                : "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    return ListView(
      children: [
        ////////////1st Line////////////////////
        ///Read from DB and update the numbers => msg2 field here
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShowDetails(
              msg1: "Total Students: ",
              msg2: "45", // needed to be updated
              fsize: w * 0.06,
            ),
            ShowDetails(
              msg1: "Total Teachers: ",
              msg2: "8", // needed to be updated
              fsize: w * 0.05,
            ),
          ],
        ),
        Divider(color: Colors.amber),
        //////////Automatic./////////////////
        ShowDetails(
          msg1: "Day/Date: ",
          msg2: dayName(),
          msg3: (DateTime.now().day.toString() +
                  "-" +
                  DateTime.now().month.toString() +
                  "-" +
                  DateTime.now().year.toString())
              .toString(),
          fsize: w * 0.045,
        ),
        Divider(color: Colors.amber),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShowDetails(
              msg1: "Today Present Student: ",
              msg2: "40", // needed to be updated //////////////////
              fsize: w * 0.042,
            ),
          ],
        ),
        Divider(height: 20),
        ///////////////////////////////////////////////////////////
        StreamBuilder(
          // stream: null,

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Column(
              // needed to be updated //////////
              children: [
                //////////////////build it with
                ShowDetails(
                  msg1: "(" + "1-8" + "):",
                  msg2: "13/15",
                  msg3: "Ms. Aysha",
                  msg4: ".....",
                  fsize: w * 0.04,
                ),
                Divider(height: 5),
                ShowDetails(
                  msg1: "(9th): ",
                  msg2: "10/14",
                  msg3: "Sir Kamran",
                  msg4: "Maths",
                  fsize: w * 0.04,
                ),
                Divider(height: 5),
                ShowDetails(
                  msg1: "(10th): ",
                  msg2: "10/14",
                  msg3: "Sir Hasan",
                  msg4: "Isl/Pak St.",
                  fsize: w * 0.04,
                ),
                Divider(height: 5),
                ShowDetails(
                  msg1: "(11th): ",
                  msg2: "10/14",
                  msg3: "Sir Kokab",
                  msg4: "Absent",
                  fsize: w * 0.04,
                ),
                Divider(height: 5),
                ShowDetails(
                  msg1: "(12th): ",
                  msg2: "10/14",
                  msg3: "Sir Mian Anwar",
                  msg4: "Comp",
                  fsize: w * 0.04,
                ),
              ],
            );
          },
        ),

        Divider(height: 25, color: Colors.amber),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShowDetails(
              msg1: "(9/10) Test: ",
              msg2: "Phy",
              fsize: w * 0.042,
            ),
            ShowDetails(
              msg1: "(11/12) Test: ",
              msg2: "Comp",
              fsize: w * 0.042,
            ),
          ],
        ),
      ],
    );
  }
}
