import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_habits/auth/AuthentificationScreen.dart';
import 'package:mini_habits/auth/load_user_data_widget.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/screen/main_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ///Theme Data of the app
  ThemeData getThemeData() {
    final primaryColor = Colors.grey[600]; //Domain Bar Color
    final seccondColor = Colors.yellowAccent[400]; //Mini Habit Bar Color
    final backgroundColor = Colors.grey[850]; //background color
    const blackColor = Colors.black;
    const whiteColor = Colors.white;
    return ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.normal,
          color: backgroundColor,
        ),
        headline2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: backgroundColor,
        ),
        headline3: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: whiteColor,
        ),
        bodyText1: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: blackColor,
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch(backgroundColor: backgroundColor).copyWith(
        primary: primaryColor,
        secondary: seccondColor,
        tertiary: seccondColor!.withOpacity(0.4),
        error: Colors.red,
      ),
    );
  }

  ///Frontend begin here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Habit',
      theme: getThemeData(),
      home: LoadUserDataWidget(
        onSuccesLoadUserInfo: (AppUser appUser) => MainScreen(appUser),
        onUnauthentificated: () => AuthentificationScreen(),
      ),
    );
  }
}
