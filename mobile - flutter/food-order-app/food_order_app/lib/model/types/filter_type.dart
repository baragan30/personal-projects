enum FilterType {
  openNow,
  freeDelivery,
}

extension FilterTypeExtension on FilterType {
  String get title {
    switch (this) {
      case FilterType.openNow:
        return "Open Now";
      case FilterType.freeDelivery:
        return "Free Delivery";
    }
    throw Exception("filterTypeExtension: name: invalid filterType");
  }
}
