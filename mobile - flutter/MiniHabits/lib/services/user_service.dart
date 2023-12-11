import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';

class AppUserService {
  static String usersCollection = 'users';
  static Future<AppUser> createAppUser(
      String mail, String username, String password) async {
    UserCredential _auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: mail, password: password);
    AppUser user = AppUser(
      mail: mail,
      username: username,
      password: password,
      userType: UserType.user,
      uid: _auth.user!.uid,
    );
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(_auth.user!.uid)
        .set(user.toJson());
    MiniHabitsDataService.createBasicMiniHabitData(_auth.user!.uid);
    return user;
  }

  static Future<void> deleteUser(AppUser appUser) async {
    final _auth = FirebaseAuth.instance;
    if (appUser.uid == _auth.currentUser!.uid) {
      _auth.signOut();
    }

    if (!appUser.isAdmin()) {
      MiniHabitsDataService.deleteMiniHabitData(appUser.uid);
    }
    FirebaseFirestore.instance.collection('users').doc(appUser.uid).delete();
  }

  static Future<UserCredential> login(String mail, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: password);
  }

  static Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  static Future<void> updateUser(AppUser appUser) async {
    FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(appUser.uid)
        .set(appUser.toJson());
  }

  static Future<void> changeUsernameUser(
      AppUser appUser, String newUsername) async {
    appUser.username = newUsername;
    await updateUser(appUser);
  }

  static Future<void> changeEmail(
      {required AppUser user,
      required String newEmail,
      required String password}) async {
    return login(user.mail, password).then(
      (value) async {
        var firebaseUser = await FirebaseAuth.instance;
        firebaseUser.currentUser?.updateEmail(newEmail);
        user.mail = newEmail;
        await updateUser(user);
      },
    ).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
  }

  static Future<void> changePassword(
      {required AppUser user,
      required String newPassword,
      required String curentPassword}) async {
    return login(user.mail, curentPassword).then(
      (value) async {
        var firebaseUser = await FirebaseAuth.instance;
        firebaseUser.currentUser?.updatePassword(newPassword);
        await updateUser(user);
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
      },
    );
  }

  static Future<List<AppUser>> getAllUsers() {
    return FirebaseFirestore.instance.collection(usersCollection).get().then(
        (value) => value.docs
            .map((userJSON) => AppUser.fromJson(userJSON, userJSON.id))
            .toList());
  }

  static Future<List<AppUser>> getAllSpecialists() {
    return FirebaseFirestore.instance.collection(usersCollection).get().then(
        (value) => value.docs
            .map((userJSON) => AppUser.fromJson(userJSON, userJSON.id))
            .where((user) => user.isSpecialist())
            .toList());
  }
}
