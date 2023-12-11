import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';

extension RestaurantHelper on RestaurantModel {
  bool isOpenNow() {
    if (openDays.isEmpty || startTime == null || endTime == null) {
      return false;
    }

    final DateTime now = DateTime.now();
    final int day = now.weekday;
    final TimeOfDay time = TimeOfDay.fromDateTime(now);

    final bool isOpenDay = openDays.any((openDay) => openDay.index + 1 == day);
    if (!isOpenDay) {
      return false;
    }

    if (startTime == null || endTime == null) {
      return false;
    }

    final bool isAfterStartTime =
        startTime!.hour >= time.hour && startTime!.minute >= time.minute;

    final isBeforeEndTime =
        endTime!.hour <= time.hour && endTime!.minute <= time.minute;

    return isAfterStartTime && isBeforeEndTime;
  }
}
