import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/day_type.dart';
import 'package:food_order_app/model/types/extensions/day_of_week_list_helpers.dart';
import 'package:food_order_app/model/types/extensions/time_of_day_helpers.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';

class ProgramRow extends ComboRow {
  ProgramRow({
    required List<DayOfWeek> openDays,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    super.expanded,
  }) : super(
          mainWidget: Text(
            openDays.weekDaysListToString(),
            overflow: TextOverflow.ellipsis,
          ),
          secondaryWidget: _secondaryWidget(startTime, endTime),
        );

  static Text? _secondaryWidget(TimeOfDay? startTime, TimeOfDay? endTime) {
    String? dailyProgram = TimeOfDayHelpers.dailyProgramToString(
      startTime: startTime,
      endTime: endTime,
    );
    return dailyProgram != null ? Text(dailyProgram) : null;
  }
}
