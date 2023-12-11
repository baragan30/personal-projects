import 'package:food_order_app/model/types/day_type.dart';

extension DayOfWeekListHelpers on List<DayOfWeek> {
  bool _isIncrementalList() {
    for (int i = 1; i < length; i++) {
      if (this[i].index != this[i - 1].index + 1) {
        return false;
      }
    }
    return true;
  }

  String _incrementalListToString() {
    return "${this[0].shortTitle()} - ${this[length - 1].shortTitle()}";
  }

  String _neincrementalDaysListToString() {
    List<String> stringsList =
        map((DayOfWeek day) => day.firstLetterTitle()).toList();
    return stringsList.join(', ');
  }

  String weekDaysListToString() {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return this[0].title();
    }
    // delete duplicates and sort
    List<DayOfWeek> sortedDays = [...toSet()];
    sortedDays.sort(
      (DayOfWeek d1, DayOfWeek d2) {
        return d1.index.compareTo(d2.index);
      },
    );
    if (_isIncrementalList()) {
      return _incrementalListToString();
    }
    return _neincrementalDaysListToString();
  }
}
