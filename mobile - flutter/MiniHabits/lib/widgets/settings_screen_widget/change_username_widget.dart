import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/services/form_service.dart';
import 'package:mini_habits/services/user_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/app_text_form_field.dart';
import 'package:mini_habits/widgets/primitive_widgets/rounded_container.dart';

class ChangeUsernameWidget extends StatelessWidget {
  ///Can change the username of curent user
  ///!It's veru similar with change_mail_widget
  ChangeUsernameWidget(
      {required this.appUser, Key? key, required this.reloadFunction})
      : super(key: key);
  AppUser appUser;
  Function(VoidCallback fn) reloadFunction;

  final _formKey = GlobalKey<FormState>();

  String _username = "";

  void changeUsername(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      reloadFunction(() {
        AppUserService.changeUsernameUser(appUser, _username);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return RoundedContainer(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              labelText: FormService.usernameLabelText,
              validator: FormService.usernameValidator,
              initialValue: appUser.username,
              onSaved: (username) {
                _username = username!;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: theme.colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              ),
              onPressed: () {
                changeUsername(context);
              },
              child: Text(
                "Change your username",
                style: theme.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
