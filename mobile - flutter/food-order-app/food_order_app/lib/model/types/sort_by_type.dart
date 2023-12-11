enum SortByType {
  topRated,
  costLowToHigh,
  costHighToLow,
  none,
}

extension SortByTypeExtension on SortByType {
  String get title {
    switch (this) {
      case SortByType.topRated:
        return "Top Rated";
      case SortByType.costLowToHigh:
        return "Cost Low to High";
      case SortByType.costHighToLow:
        return "Cost High to Low";
      case SortByType.none:
        return "None";
    }
    throw Exception("SortByTypeExtension: name: invalid SortByType");
  }
}
