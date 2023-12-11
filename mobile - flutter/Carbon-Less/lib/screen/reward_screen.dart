import 'package:echofootprint2/model/DUMMY_DATA.dart';
import 'package:echofootprint2/model/company.dart';
import 'package:echofootprint2/screen/base_screen.dart';
import 'package:echofootprint2/screen/main_screen.dart';
import 'package:echofootprint2/widget/my_box.dart';
import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  static const String routeName = '/reward';
  RewardScreen({Key key}) {}
  @override
  Widget build(BuildContext context) {
    final cls = (ModalRoute.of(context).settings.arguments as Company);
    final id = cls.id;
    var material = cls.material;
    final Company company = companies.firstWhere((element) => element.id == id);
    final foodPrint = company.foodPrint;
    final actualScore = user.points;
    final double progress = foodPrint / actualScore * 100;
    if (company.t == false) {
      user.curentStatus += foodPrint;
      company.t = true;
    }

    final double _titleWidgetWidth = 200;
    final double _buttonWidth = 300;
    return BaseScreen(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              MyBox(
                height: _titleWidgetWidth,
                width: _titleWidgetWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${company.foodPrint} carbon footprint',
                      style: TextStyle(fontSize: 18),
                    ),
                    Center(
                      child: Text(
                        '${company.company_name}  :   ${material}',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '${(user.getGoalPercentage() * 100 as double).toStringAsFixed(2)}% progress',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MainScreen.routeName, (Route<dynamic> route) => false);
                },
                child: MyBox(
                  child: Text("Done"),
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
