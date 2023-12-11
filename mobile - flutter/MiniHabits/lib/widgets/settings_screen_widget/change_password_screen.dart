import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/services/form_service.dart';
import 'package:mini_habits/services/user_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/app_text_form_field.dart';
import 'package:mini_habits/widgets/primitive_widgets/rounded_container.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key, required this.appUser}) : super(key: key);
  AppUser appUser;
  String _password1 = "";
  String _password2 = "";
  String _curentPassword = "";
  final _formKey = GlobalKey<FormState>();

  void changePasswordAndSignOut(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      AppUserService.changePassword(
              user: appUser,
              newPassword: _password1,
              curentPassword: _curentPassword)
          .then((_) {
        AppUserService.logout();
        Navigator.pop(context);
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
            /// New password
            AppTextFormField(
              labelText: FormService.newPasswordLabelText,
              validator: FormService.passwordValidator,
              isPasswordLabel: true,
              onSaved: (password) {
                _password1 = password!;
              },
            ),

            /// Confirm new password
            AppTextFormField(
              labelText: FormService.confirmPasswordLabelText,
              validator: (password) {
                _formKey.currentState!.save();
                return FormService.confirmPasswordValidator(
                    _password1, _password2);
              },
              isPasswordLabel: true,
              onSaved: (password) {
                _password2 = password!;
              },
            ),

            ///curent password
            AppTextFormField(
              labelText: FormService.passwordLabelText,
              validator: FormService.noValidator,
              isPasswordLabel: true,
              onSaved: (curentPassword) {
                _curentPassword = curentPassword!;
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
                changePasswordAndSignOut(context);
              },
              child: Text(
                "Change your password",
                style: theme.textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
