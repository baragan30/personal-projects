import 'package:echofootprint2/model/DUMMY_DATA.dart';
import 'package:echofootprint2/model/voucher.dart';
import 'package:echofootprint2/screen/base_screen.dart';
import 'package:echofootprint2/widget/my_box.dart';
import 'package:echofootprint2/widget/voucher_widget.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class VouchersScreen extends StatelessWidget {
  static const String routeName = '/vouchers';
  const VouchersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _buttonWidth = 300;
    return BaseScreen(
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 55),
              Container(
                width: 280,
                height: 350,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemBuilder: (ctx, index) {
                    Voucher voucher = vouchers[index];
                    return VoucherWidget(voucher);
                  },
                  itemCount: vouchers.length,
                ),
              ),
              SizedBox(height: 20),
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
