import 'clock_text.dart';
import 'package:flutter/material.dart';
import 'clock_dial_painter.dart';
import 'clock_hands.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;
  // final bool showHourHandleHeartShape;
  var current_min;
  var current_hour;
  String clockface_background;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    current_min = DateTime.now().minute;
    current_hour = DateTime.now().hour;

    if (current_hour >= 19) {
      clockface_background = "assets/day_night.png";
    } else if (current_hour >= 17) {
      clockface_background = "assets/sunset.png";
    } else if (current_hour >= 9) {
      clockface_background = "assets/day_light.png";
    } else if (current_hour >= 6) {
      clockface_background = "assets/sunrise.jpg";
    } else if (current_hour >= 0) {
      clockface_background = "assets/day_night.png";
    } else {
      clockface_background = "assets/gifting_time.gif";
    }

    return Center(
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new AspectRatio(
          aspectRatio: 0.75,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(clockface_background),
                  fit: BoxFit.contain,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(8.0, 0),
                      blurRadius: 13,
                      spreadRadius: 1,
                      color: Colors.white12)
                ]),
          ),
        ),
      ),
    );
  }
}
