import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCircularIndicator extends StatelessWidget {
  MyCircularIndicator(this.text, this.percent);

  String text;
  double percent;

  @override
  Widget build(BuildContext context) {
    if (percent > 100) percent = 100;
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 13.0,
      animation: true,
      percent: percent,
      animationDuration: 1000,
      center: Text(
        "${percent * 100}%",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.green,
    );
  }
}
