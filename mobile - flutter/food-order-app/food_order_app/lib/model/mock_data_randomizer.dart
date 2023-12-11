import 'dart:math';

extension MockDataRandomizer on Random {
  bool hasData({required int chance}) {
    int randomNumber = nextInt(chance);
    return randomNumber != 0;
  }

  double randomRatingNumber() {
    return nextDouble() * 5;
  }

  int randomNumber() {
    Random random = Random();
    return nextInt(1001);
  }

  double randomPrice() {
    //return random price with maxim 2 decimals
    return (nextDouble() * 10000).roundToDouble() / 100;
  }
}
