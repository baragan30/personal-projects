import 'package:food_order_app/model/user/app_user.dart';

class DummyData {
  static List<AppUser> usersList = [
    AppUser(
        uid: "123",
        mail: "baragan30@yahoo.com",
        username: "baragan30",
        password: "123456"),
  ];
  static AppUser? loggedInUser = usersList[0];
}
