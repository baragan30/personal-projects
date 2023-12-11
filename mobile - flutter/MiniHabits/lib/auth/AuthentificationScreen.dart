import 'package:flutter/material.dart';
import 'package:mini_habits/services/form_service.dart';
import 'package:mini_habits/services/user_service.dart';

class AuthentificationScreen extends StatefulWidget {
  @override
  _AuthentificationScreenState createState() => _AuthentificationScreenState();
  bool isLoading = false;
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _userPassword2 = '';
  String _username = "";

  void changeLoadingStatus() {
    setState(() {
      widget.isLoading = !widget.isLoading;
    });
  }

  Future<void> _signUp() async {
    changeLoadingStatus();
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      await AppUserService.createAppUser(_userEmail, _username, _userPassword)
          .then((value) {})
          .onError((error, stackTrace) {
        print(error);
        print(stackTrace);
      });
    }
    changeLoadingStatus();
  }

  Future<void> _signIn() async {
    changeLoadingStatus();
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      await AppUserService.login(_userEmail, _userPassword)
          .then((value) {})
          .onError((error, stackTrace) {
        print(error);
        print(stackTrace);
      });
    }
    changeLoadingStatus();
  }

  ///! it is possible that it can be replaced with AppTextFormField
  TextFormField getTextFormField(
      {required Key key,
      required TextStyle textStyle,
      required String labelText,
      required FormFieldValidator<String> validator,
      required FormFieldSetter<String> onSaved,
      bool isPasswordLabel = false}) {
    return TextFormField(
      key: key,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textStyle.color!, width: 1.0),
          ),
          enabledBorder: null),
      obscureText: isPasswordLabel,
      enableSuggestions: !isPasswordLabel,
      autocorrect: false,
      validator: validator,
      onSaved: onSaved,
    );
  }

  SizedBox getSizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle textStyle = theme.textTheme.headline2!;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Center(
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///Email Adresss Field
                    getTextFormField(
                      key: const ValueKey('email'),
                      textStyle: textStyle,
                      labelText: FormService.mailLabelText,
                      validator: FormService.mailValidator,
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                    getSizedBox(),

                    ///Username Field
                    if (!_isLogin)
                      getTextFormField(
                        key: const ValueKey('username'),
                        textStyle: textStyle,
                        labelText: 'username',
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Username must be at least 6 characters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                    if (!_isLogin) getSizedBox(),

                    ///Password Field
                    getTextFormField(
                      key: const ValueKey('password'),
                      textStyle: textStyle,
                      labelText: FormService.passwordLabelText,
                      validator: FormService.passwordValidator,
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                      isPasswordLabel: true,
                    ),

                    getSizedBox(),

                    ///Password Field 2
                    if (!_isLogin)
                      getTextFormField(
                        key: const ValueKey('password2'),
                        textStyle: textStyle,
                        labelText: FormService.confirmPasswordLabelText,
                        validator: (_) => FormService.confirmPasswordValidator(
                            _userPassword, _userPassword2),
                        onSaved: (value) {
                          _userPassword2 = value!;
                        },
                        isPasswordLabel: true,
                      ),

                    getSizedBox(),
                    if (widget.isLoading) const CircularProgressIndicator(),

                    ///Submit Button
                    if (!widget.isLoading)
                      TextButton(
                        onPressed: _isLogin ? _signIn : _signUp,
                        child: Text(
                          _isLogin ? 'Login' : 'Signup',
                          style: textStyle,
                        ),
                      ),

                    ///Create new account Buttton
                    if (!widget.isLoading)
                      TextButton(
                        child: Text(
                          _isLogin
                              ? 'Create new account'
                              : 'I already have an account',
                          style: textStyle,
                        ),
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
