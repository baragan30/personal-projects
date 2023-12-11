class CustomSizeHelper {
  ///Offsets
  //Thin
  static double ultraThinOffset() {
    return defaultOffset() * 0.065;
  }

  static double veryThinOffset() {
    return defaultOffset() * 0.1;
  }

  static double thinOffset() {
    return defaultOffset() * 0.2;
  }

  //Small
  static double ultraSmallOffset() {
    return defaultOffset() * 0.35;
  }

  static double verySmallOffset() {
    return defaultOffset() * 0.5;
  }

  static double smallOffset() {
    return defaultOffset() * 0.75;
  }

  static double defaultOffset() {
    return 18;
  }

  //Big
  static double bigOffset() {
    return defaultOffset() * 4 / 3;
  }

  static double veryBigOffset() {
    return defaultOffset() * 2;
  }

  ///Sizes
  //Thin

  static double ultraThinSize() {
    return defaultSize() * 0.05;
  }

  static double veryThinSize() {
    return defaultSize() * 0.1;
  }

  static double thinSize() {
    return defaultSize() * 0.2;
  }

  //Small
  static double ultraSmallSize() {
    return defaultSize() * 0.35;
  }

  static double verySmallSize() {
    return defaultSize() * 0.5;
  }

  static double smallSize() {
    return defaultSize() * 0.75;
  }

  static double defaultSize() {
    return 100;
  }

  //Big
  static double bigSize() {
    return defaultSize() * 1.3;
  }

  static double veryBigSize() {
    return defaultSize() * 1.6;
  }

  static double ultraBigSize() {
    return defaultSize() * 2;
  }

  //Large
  static double largeSize() {
    return defaultSize() * 2.5;
  }

  static double veryLargeSize() {
    return defaultSize() * 3;
  }

  static double ultraLargeSize() {
    return defaultSize() * 3.5;
  }

  static double dividerThickness() {
    return 0.8;
  }

  static double descriptionSize() {
    return 16;
  }

  static double carouselImageHeight() {
    return 300;
  }
}
