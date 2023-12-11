enum FoodCategory {
  pizza,
  burger,
  steak,
  pasta,
  soup,
  salad,
  dessert,
}

extension FoodCategoryTypeExtension on FoodCategory {
  String title() {
    switch (this) {
      case FoodCategory.pizza:
        return "Pizza";
      case FoodCategory.burger:
        return "Burgers";
      case FoodCategory.pasta:
        return "Pasta";
      case FoodCategory.steak:
        return "Steak";
      case FoodCategory.soup:
        return "Soup";
      case FoodCategory.salad:
        return "Salad";
      case FoodCategory.dessert:
        return "Dessert";
    }
    throw StateError("FoodCategoryUtils getName error");
  }

  String imageUrl() {
    switch (this) {
      case FoodCategory.pizza:
        return "https://img.icons8.com/?size=512&id=jqc7iHBAzWIJ&format=png";
      case FoodCategory.burger:
        return "https://img.icons8.com/?size=512&id=KQdlN6Mkivf9&format=png";
      case FoodCategory.pasta:
        return "https://img.icons8.com/?size=512&id=DNc4KguH6u2O&format=png";
      case FoodCategory.steak:
        return "https://img.icons8.com/?size=1x&id=ovpzFp00lmSi&format=png";
      case FoodCategory.soup:
        return "https://img.icons8.com/?size=1x&id=m6AZNk056tR7&format=png";
      case FoodCategory.salad:
        return "https://img.icons8.com/?size=1x&id=dYm1ofAw4LKl&format=png";
      case FoodCategory.dessert:
        return "https://img.icons8.com/?size=1x&id=2san48WPZRBS&format=png";
    }

    throw StateError("FoodCategoryUtils getName error");
  }
}
