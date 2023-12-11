import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/widgets/settings_screen_widget/change_mail_widget.dart';
import 'package:mini_habits/widgets/settings_screen_widget/change_password_screen.dart';
import 'package:mini_habits/widgets/settings_screen_widget/change_username_widget.dart';
import 'package:mini_habits/widgets/settings_screen_widget/share_your_minihabits_switch.dart';

class SettingsScreen extends StatefulWidget {
  ///Settings Screen
  SettingsScreen({required this.appUser, Key? key}) : super(key: key);

  AppUser appUser;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Hello ${widget.appUser.username}')),
      backgroundColor: theme.colorScheme.background,
      body: ListView(
        children: [
          ///Share your MiniHabits Settings
          ShareYourMinihabitsSwitch(appUser: widget.appUser),

          /// Change username
          ChangeUsernameWidget(
              appUser: widget.appUser, reloadFunction: setState),

          ///ChangeMailWidget
          ChangeMailWidget(appUser: widget.appUser),

          ///Change Password Screen
          ChangePasswordScreen(appUser: widget.appUser),
        ],
      ),
    );
  }
}
