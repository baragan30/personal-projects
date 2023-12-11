enum TextFiledType {
  email,
  password,
  username,
}

extension TextFieldTypeUtils on TextFiledType {
  String? validate(String? input) {
    if (input == null) {
      return null;
    }
    switch (this) {
      case TextFiledType.email:
        {
          if (input.isEmail()) {
            return null;
          }
          return "Invalid email";
        }
      case TextFiledType.password:
        {
          if (input.isPassword()) {
            return null;
          }
          return "Invalid password";
        }
      case TextFiledType.username:
        {
          if (input.isUsername()) {
            return null;
          }
          return "Invalid username";
        }
      default:
        throw StateError("should not be here");
    }
  }

  String labelName() {
    switch (this) {
      case TextFiledType.email:
        {
          return "Email";
        }
      case TextFiledType.password:
        {
          return "Password";
        }
      case TextFiledType.username:
        {
          return "Username";
        }
      default:
        throw StateError("should not be here");
    }
  }

  bool isPassword() {
    return this == TextFiledType.password;
  }
}

extension TextFieldString on String {
  bool defaultValidator() {
    if (isEmpty || length < 6) {
      return false;
    }
    return true;
  }

  bool isEmail() {
    if (!defaultValidator()) {
      return false;
    }

    if (!contains('@')) {
      return false;
    }

    return true;
  }

  bool isPassword() {
    return defaultValidator();
  }

  bool isUsername() {
    return defaultValidator();
  }
}
