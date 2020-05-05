import 'package:donttouch/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:donttouch/components/select_time.dart';
import 'package:intl/intl.dart';
import 'package:donttouch/components/select_date.dart';
import 'package:sensors/sensors.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  double x, y, z;

  TimeOfDay startTime;
  TimeOfDay endTime;

  Future<DateTime> selectedDate(BuildContext context) async {
    datePicked = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));

    return datePicked;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF4A92FF),
      body: Padding(
        padding: const EdgeInsets.only(top: 110.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 130.0,
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'DontTouch',
              style: kLogoDecoration,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: SwitchListTile(
                activeColor: Color(0XFFFBC531),
                inactiveThumbColor: Color(0XFF999999),
                title: Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    'Active DontTouch',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                value: true,
                onChanged: (newValue) {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0XFF6bA6FF),
              ),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Set Calendar Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  RaisedButton(
                    color: Color(0XFFFBC531),
                    child: Icon(
                      Icons.calendar_today,
                      color: Color(0XFF4A92FF),
                    ),
                    onPressed: () async {
                      var date = await selectedDate(context);
                      if (date != null) {
                        setState(() {
                          selectDate = date;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0XFF6bA6FF),
              ),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Start Monitor Time',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  RaisedButton(
                    child: Icon(
                      Icons.timer,
                      color: Color(0XFF4A92FF),
                    ),
                    color: Color(0XFFFBC531),
                    onPressed: () async {
                      var time = await selectTime(context);
                      if (time != null) {
                        setState(() {
                          startTime = time;
                          print(startTime);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0XFF6bA6FF),
              ),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Set Monitor Time',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  RaisedButton(
                    child: Icon(
                      Icons.timer,
                      color: Color(0XFF4A92FF),
                    ),
                    color: Color(0XFFFBC531),
                    onPressed: () async {
                      var time = await selectTime(context);
                      print(time);
                      if (time != null) {
                        setState(() {
                          endTime = time;
                          print(endTime);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0XFF6bA6FF),
              ),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '${selectDate != null ? DateFormat.yMMMMd('en_US').format(selectDate) : "Set Date"}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TimeDisplay(time: startTime),
                      SizedBox(
                        width: 80.0,
                      ),
                      TimeDisplay(time: endTime),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
//            Container(
//              width: 350.0,
//              height: 50.0,
//              child: RaisedButton(
//                child: Text(
//                  'Set Monitor',
//                  style: TextStyle(
//                    color: Color(0XFF4A92FF),
//                  ),
//                ),
//                color: Color(0XFFFBC531),
//                onPressed: () {
////                  selectTime(context, 2);
//                },
//              ),
//            ),
            Text('$x $y $z'),
          ],
        ),
      ),
    );
  }
}

class TimeDisplay extends StatelessWidget {
  TimeDisplay({this.time});
  final time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        '${time != null ? time.format(context) : "Set time"}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
