extension MapHelper<T> on Map<T, bool> {
  List<T> trueKeys() {
    List<T> keys = [];
    for (var entry in entries) {
      if (entry.value) {
        keys.add(entry.key);
      }
    }
    return keys;
  }
}
