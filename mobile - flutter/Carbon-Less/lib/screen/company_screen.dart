import 'package:echofootprint2/widget/my_box.dart';
import 'package:echofootprint2/widget/my_circular_indicator.dart';
import 'package:flutter/material.dart';

import 'base_screen.dart';

class CompanyScreen extends StatelessWidget {
  static const String routeName = '/company';
  const CompanyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final double _titleWidgetWidth = 200;
    final double _buttonWidth = 300;

    return BaseScreen(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              MyBox(
                height: 150,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Carbon footprint :',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      ' - 20 T',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              MyCircularIndicator("annual goal", 0.54),
              SizedBox(height: 20),
              MyBox(
                height: 100,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '+ 38 users today',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '2075 users total',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
