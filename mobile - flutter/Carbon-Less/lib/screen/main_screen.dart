import 'package:echofootprint2/model/DUMMY_DATA.dart';
import 'package:echofootprint2/screen/base_screen.dart';
import 'package:echofootprint2/screen/progress_screen.dart';
import 'package:echofootprint2/screen/vouchers_screen.dart';
import 'package:echofootprint2/widget/my_box.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double _titleWidgetWidth = 220;
    final double _buttonWidth = 300;
    return BaseScreen(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              MyBox(
                height: 200,
                width: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${user.getGoalPercentage() * 100}% progress',
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProgressScreen.routeName);
                },
                child: MyBox(
                  child: Text(
                    "View Progress",
                    style: TextStyle(fontSize: 15),
                  ),
                  width: _buttonWidth,
                  height: 50,
                ),
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(VouchersScreen.routeName);
                },
                child: MyBox(
                  child: Text(
                    "View Vouchers",
                    style: TextStyle(fontSize: 15),
                  ),
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
