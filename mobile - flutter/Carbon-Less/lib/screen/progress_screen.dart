import 'package:echofootprint2/model/DUMMY_DATA.dart';
import 'package:echofootprint2/widget/my_box.dart';
import 'package:echofootprint2/widget/my_circular_indicator.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';
import 'main_screen.dart';

class ProgressScreen extends StatefulWidget {
  static const String routeName = '/progress';
  const ProgressScreen({Key key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    final double _buttonWidth = 300;

    return BaseScreen(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              MyBox(
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Your carbon footprint goal :',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      '${user.goal} g',
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      'Currently you have ${user.curentStatus} g',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              MyCircularIndicator("mountly goal", user.getGoalPercentage()),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MainScreen.routeName, (Route<dynamic> route) => false);
                },
                child: MyBox(
                  child: Text("Home Screen"),
                  width: _buttonWidth,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
