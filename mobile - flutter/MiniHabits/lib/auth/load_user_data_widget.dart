import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';

class LoadUserDataWidget extends StatelessWidget {
  /// verify if the user is log in and upload userDAta
  LoadUserDataWidget(
      {required this.onSuccesLoadUserInfo,
      required this.onUnauthentificated,
      Key? key})
      : super(key: key);

  Function onSuccesLoadUserInfo;
  Function onUnauthentificated;

  Widget getErrorScreen(String string, BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Habit'),
        backgroundColor: theme.colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ),
      body: Center(
          child: Text(
        string,
        style: theme.textTheme.headline3,
      )),
      backgroundColor: theme.colorScheme.background,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String uid = snapshot.data!.uid;
            return FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .get()
                  .then((userJSON) => AppUser.fromJson(userJSON, uid)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> data) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    data.data == null) {
                  return getErrorScreen("Loading ... ", context);
                }
                if (snapshot.hasError) {
                  return getErrorScreen(snapshot.error.toString(), context);
                }
                AppUser appUser = data.data as AppUser;
                if (appUser.isBanned()) {
                  return getErrorScreen(
                      'User ${appUser.username} was banned', context);
                }
                if (appUser.userType == UserType.admin) {
                  FirebaseAuth.instance.signOut();
                }
                return onSuccesLoadUserInfo(appUser);
              },
            );
          } else {
            return onUnauthentificated();
          }
        });
  }
}
