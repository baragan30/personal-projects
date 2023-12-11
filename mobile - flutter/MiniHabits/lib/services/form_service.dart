class FormService {
  ///username
  static const String usernameLabelText = "Username";
  static String? usernameValidator(String? username) {
    if (username!.isEmpty || username.length < 6) {
      return 'username must be at least 6 characters long';
    }
    return null;
  }

  ///mail
  static const String mailLabelText = "Your mail";
  static String? mailValidator(String? mail) {
    if (mail!.isEmpty || !mail.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  ///password
  static const String passwordLabelText = "Password";
  static const String newPasswordLabelText = "New password";
  static const String confirmPasswordLabelText = "Confirm password";
  static String? passwordValidator(String? password) {
    if (password!.isEmpty || password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? password1, String? password2) {
    if (password1 != password2) {
      return 'Password must be the same';
    }
    return null;
  }

  static String? noValidator(String? _) {
    return null;
  }
}
