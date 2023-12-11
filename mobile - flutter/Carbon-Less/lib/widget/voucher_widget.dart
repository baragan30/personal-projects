import 'package:echofootprint2/model/voucher.dart';
import 'package:echofootprint2/widget/my_box.dart';
import 'package:flutter/material.dart';

class VoucherWidget extends StatelessWidget {
  Voucher voucher;
  VoucherWidget(this.voucher);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(height: 10),
        MyBox(
          height: 50,
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                voucher.company,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                voucher.details,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
