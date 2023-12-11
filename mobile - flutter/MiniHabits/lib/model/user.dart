import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  AppUser(
      {required this.mail,
      required this.username,
      required this.password,
      required this.userType,
      required this.uid});
  AppUser.withBan(
      {required this.mail,
      required this.username,
      required this.userType,
      required this.ban,
      required this.uid});

  factory AppUser.fromJson(
          DocumentSnapshot<Map<String, dynamic>> json, String uid) =>
      AppUser.withBan(
        mail: json['mail'],
        username: json['username'],
        userType: UserType.values
            .firstWhere((type) => type.toString() == json['userType']),
        ban: json['ban'],
        uid: uid,
      );

  String mail;
  String username;
  String password = "";
  UserType userType;
  bool ban = false;
  String uid = "";

  bool isSpecialist() {
    return this.userType == UserType.specialist;
  }

  bool isAdmin() {
    return this.userType == UserType.admin;
  }

  bool isBanned() {
    return ban;
  }

  void toggleBan() {
    ban = !ban;
  }

  void toggleUserType() {
    switch (userType) {
      case (UserType.user):
        userType = UserType.specialist;
        break;
      case (UserType.specialist):
        userType = UserType.user;
    }
  }

  Map<String, dynamic> toJson() => {
        'mail': mail,
        'username': username,
        'userType': userType.toString(),
        'ban': ban
      };
}

enum UserType { user, specialist, admin }
