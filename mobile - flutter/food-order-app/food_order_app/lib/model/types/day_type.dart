enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekExtension<T extends DayOfWeek> on DayOfWeek {
  String title() {
    return name[0].toUpperCase() + name.substring(1);
  }

  String shortTitle() {
    return title().substring(0, 3);
  }

  String firstLetterTitle() {
    return title()[0];
  }
}
