import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'clock/clock.dart';
/*MIT License

Copyright (c) [2020] [Ntem, Ndewe]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      title: 'Flutter Clock Challenge',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Clock Challenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var current_min;
  var current_hour;
  var current_month;
  var current_day;
  var current_year;
  var background_image;
  String checker = "am";
  String time_presentation = "Time...";
  String date_outputstring = "Time...";

  final text_content = [
    "The life of a leaf is like a beatiful done soup controlled with time.",
    "The invention that man needs is hidden in time. ",
    "The difference between the past and the future is time.",
    "We can become the best if we spend time to develop ourselves.",
    "We don't know how much time we have so lets make well our past mistakes.",
  ];
  final text_author = [
    "Bro. Ntem Baba",
    "The Editors",
    "Punch News Papers",
    "Monday Monady Magazine",
    "Western Union",
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 3) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
    loadData();
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), _incrementCounter);
  }

  @override
  Widget build(BuildContext context) {
    current_min = DateTime.now().minute;
    current_hour = DateTime.now().hour;
    current_day = DateTime.now().day;
    current_month = DateTime.now().month;
    current_year = DateTime.now().year;
    if (current_hour > 12) {
      current_hour = current_hour - 12;
      checker = "pm";
      time_presentation =
          current_hour.toString() + ":" + current_min.toString() + checker;
    } else {
      time_presentation =
          current_hour.toString() + ":" + current_min.toString() + checker;
    }
    //getting the entir date systems into a string and preparing to print it out
    date_outputstring = current_day.toString() +
        "/" +
        current_month.toString() +
        "/" +
        current_year.toString();
    //dealing with background and the days...
    if (current_month >= 12) {
      if (current_day >= 25) {
        background_image = "assets/gifting_time.gif";
      } else {
        background_image = "assets/winter.jfif";
      }
    } else if (current_month > 8) {
      background_image = "assets/autumn.jpg";
    } else if (current_month > 5) {
      background_image = "assets/summer.jpg";
    } else if (current_month > 3) {
      background_image = "assets/summer.jpg";
    } else {
      background_image = "assets/winter_notd.jpg";
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: new AspectRatio(
        aspectRatio: 1.6666667,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background_image), fit: BoxFit.cover),
          ),
          child: new Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: new Clock(),
                ),
                Expanded(
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            boxShadow: [
                              new BoxShadow(
                                offset: new Offset(10.0, 5.0),
                                color: Colors.yellow[900],
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                  offset: new Offset(10.0, 5.0),
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -8)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              date_outputstring,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Arial Black',
                                  fontSize: 24.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            boxShadow: [
                              new BoxShadow(
                                offset: new Offset(10.0, 5.0),
                                color: Colors.yellow[900],
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                  offset: new Offset(10.0, 5.0),
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -8)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              time_presentation,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Arial Black',
                                  fontSize: 26.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Text(
                            text_content[_counter],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Berlin Sans FB',
                              fontSize: 23.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Text(
                            text_author[_counter],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'MV Boli',
                                fontSize: 18.0,
                                color: Colors.blue[700],
                                backgroundColor: Colors.white),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
