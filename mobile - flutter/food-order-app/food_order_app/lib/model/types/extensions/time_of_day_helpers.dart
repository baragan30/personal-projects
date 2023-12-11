import 'dart:math';

import 'package:flutter/material.dart';

extension TimeOfDayHelpers on TimeOfDay {
  static TimeOfDay random() {
    Random random = Random();
    int hour = random.nextInt(24);
    int minute = random.nextInt(60);
    return TimeOfDay(hour: hour, minute: minute);
  }

  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }

  static String? dailyProgramToString({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    if (startTime == null && endTime == null) {
      return null;
    }
    if (startTime == null) {
      return endTime!.to24hours();
    }
    if (endTime == null) {
      return startTime.to24hours();
    }
    return "${startTime.to24hours()} - ${endTime.to24hours()}";
  }
}
