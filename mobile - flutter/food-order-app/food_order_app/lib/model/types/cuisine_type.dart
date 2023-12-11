enum CuisineType {
  italian,
  chinese,
  mexican,
  indian,
  japanese,
  thai,
  french,
  spanish,
  greek,
  lebanese,
  turkish,
  moroccan,
  vietnamese,
  korean,
  brazilian,
  ethiopian,
  russian,
  german,
  peruvian,
  indonesian,
  malaysian,
  egyptian,
  jamaican,
  argentinian,
  british,
  swedish,
  iranian,
  nigerian,
  australian,
}

extension CuisineTypeExtension on CuisineType {
  String title() {
    //make first letter greater
    return name[0].toUpperCase() + name.substring(1);
  }
}

extension CuisineTypeListExtension on List<CuisineType> {
  String titlesString() {
    return map((CuisineType cuisine) => cuisine.title()).join('/ ');
  }
}
