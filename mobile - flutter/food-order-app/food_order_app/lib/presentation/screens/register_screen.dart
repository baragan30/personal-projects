import 'package:flutter/material.dart';
import 'package:food_order_app/application/authentification_service.dart';
import 'package:food_order_app/model/image_urls_utils.dart';
import 'package:food_order_app/presentation/screens/abstract_screens/carousel_screen.dart';
import 'package:food_order_app/presentation/widgets/auth_widgets/food_app_form_field.dart';
import 'package:food_order_app/presentation/widgets/auth_widgets/form_button.dart';
import 'package:food_order_app/routers/auth_router.dart';
import 'package:food_order_app/utils/ui_helpers/form_field_type_utils.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class RegisterScreen extends CarouselScreen {
  RegisterScreen() : super(imageUrls: ImageUrlUtils.loginScreenImages);

  @override
  CarouselScreenState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends CarouselScreenState<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _mailController = TextEditingController();

  final TextEditingController _passwordController1 = TextEditingController();

  final TextEditingController _passwordController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  void changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _register() async {
    final bool isFormDataValid = _formKey.currentState!.validate();
    if (isFormDataValid) {
      if (_passwordController1.text == _passwordController2.text) {
        changeLoadingStatus();
        try {
          await AuthentificationService.registerAppUser(
              _usernameController.text,
              _mailController.text,
              _passwordController1.text);
        } catch (e) {}
        changeLoadingStatus();
      } else {
        ///Display Error
      }
    }
  }

  @override
  Widget child() {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Container(
      margin: EdgeInsetsHelper.mostlyHorizontalDefaultEdgeInsets(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Body
            SizedBoxUiHelper.defaultSizedBox(),
            Center(
              child: Text(
                "Welcome!",
                style: textTheme.titleLarge,
              ),
            ),
            SizedBoxUiHelper.smallSizedBox(),

            Center(
              child: Text(
                "Sign up now",
                style: textTheme.bodyLarge,
              ),
            ),
            SizedBoxUiHelper.defaultSizedBox(),
            FoodAppFormField(
              textFiledType: TextFiledType.username,
              controller: _mailController,
              themeData: themeData,
            ),
            SizedBoxUiHelper.verySmallSizedBox(),
            FoodAppFormField(
              textFiledType: TextFiledType.email,
              controller: _mailController,
              themeData: themeData,
            ),
            SizedBoxUiHelper.verySmallSizedBox(),
            FoodAppFormField(
              textFiledType: TextFiledType.password,
              controller: _passwordController1,
              themeData: themeData,
            ),
            SizedBoxUiHelper.verySmallSizedBox(),
            FoodAppFormField(
              textFiledType: TextFiledType.password,
              controller: _passwordController2,
              themeData: themeData,
            ),
            SizedBoxUiHelper.defaultSizedBox(),
            if (_isLoading) ...[
              const CircularProgressIndicator(),
              SizedBoxUiHelper.defaultSizedBox(),
            ],

            /// Register Button
            FormButton(
              onPressed: () {},
              title: "Register",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AuthPages.login.routeName());
                  },
                  child: Text("Sign in",
                      style: TextStyle(
                        color: themeData.colorScheme.secondary,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
