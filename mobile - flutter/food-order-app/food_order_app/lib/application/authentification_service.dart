import 'dart:math';

import 'package:collection/collection.dart';
import 'package:food_order_app/application/dummy_data.dart';
import 'package:food_order_app/model/user/app_user.dart';

class AuthentificationService {
  static bool isLoggeIn = true;

  static Future<AppUser?> registerAppUser(
      String username, String mail, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    var rng = Random();
    AppUser appUser = AppUser(
        uid: rng.nextInt(1000000).toString(),
        mail: mail,
        username: username,
        password: password);
    DummyData.loggedInUser = appUser;
    DummyData.usersList.add(appUser);
    return Future.delayed(Duration.zero, () => DummyData.loggedInUser);
  }

  static Future<AppUser?> login(String mail, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    AppUser? user = DummyData.usersList.firstWhereOrNull(
        (user) => user.mail == mail && user.password == password);
    DummyData.loggedInUser = user;
    if (user == null) {
      return Future.error("Not Found");
    }
    return Future.value(DummyData.loggedInUser);
  }

  static Future<void> logout() async {
    DummyData.loggedInUser = null;
    // return Future.delayed(Duration.zero, () {});
  }

  static Stream<AppUser?> authentificationStateChanges() {
    return Stream.periodic(Duration(seconds: 2), (int count) {
      if (count % 2 == 0) {
        return DummyData.usersList.first;
      }

      return null;
    });
    // return Stream.value(DummyData.loggedInUser);
  }
}
