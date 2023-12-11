import 'package:echofootprint2/screen/company_screen.dart';
import 'package:echofootprint2/screen/main_screen.dart';
import 'package:echofootprint2/screen/progress_screen.dart';
import 'package:echofootprint2/screen/reward_screen.dart';
import 'package:echofootprint2/screen/vouchers_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.teal),
        ),
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        CompanyScreen.routeName: (ctx) => CompanyScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
        RewardScreen.routeName: (ctx) => RewardScreen(),
        ProgressScreen.routeName: (ctx) => ProgressScreen(),
        VouchersScreen.routeName: (ctx) => VouchersScreen(),
      },
    );
  }
}
