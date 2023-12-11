import 'dart:math';

extension ListHelpers<T> on List<T> {
  T fetchRandomElement() {
    Random random = Random();
    int randomIndex = random.nextInt(length);
    return this[randomIndex];
  }

  List<T> fetchRandomElements() {
    List<T> randomElements = <T>[];
    Random random = Random();
    int count = random.nextInt(length);

    List<T> shuffledList = List.from(this)..shuffle();

    for (int i = 0; i < count; i += 1) {
      randomElements.add(shuffledList[i]);
    }

    return randomElements;
  }

  List<T> maxKElements(int k) {
    if (k <= 0) {
      return [];
    }
    return sublist(0, min(k, length));
  }
}
