import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/services/form_service.dart';
import 'package:mini_habits/services/user_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/app_text_form_field.dart';
import 'package:mini_habits/widgets/primitive_widgets/rounded_container.dart';

class ChangeMailWidget extends StatelessWidget {
  ///Can change the mail of curent user
  ///!It's veru similar with changeUsernameWidget
  ChangeMailWidget({required this.appUser, Key? key}) : super(key: key);

  AppUser appUser;
  final _formKey = GlobalKey<FormState>();
  String _mail = "";
  String _password = "";

  void changeMail(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      AppUserService.changeEmail(
          user: appUser, newEmail: _mail, password: _password);
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
            ///mail
            AppTextFormField(
              labelText: FormService.mailLabelText,
              validator: FormService.mailValidator,
              initialValue: appUser.mail,
              onSaved: (mail) {
                _mail = mail!;
              },
            ),

            /// password
            AppTextFormField(
              labelText: FormService.passwordLabelText,
              validator: FormService.passwordValidator,
              isPasswordLabel: true,
              onSaved: (password) {
                _password = password!;
              },
            ),

            ///Change mail button
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
                changeMail(context);
              },
              child: Text(
                "Change your mail",
                style: theme.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
