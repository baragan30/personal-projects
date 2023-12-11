import 'package:flutter/material.dart';

class Company {
  Company(
      {@required this.id,
      @required this.company_name,
      @required this.material,
      @required this.current_progress,
      @required this.max_progress,
      @required this.foodPrint});
  int id;
  String company_name;
  String material;
  int current_progress;
  int max_progress;
  int foodPrint;
  bool t = true;
}
