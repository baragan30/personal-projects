import 'package:flutter/material.dart';
import 'package:food_order_app/application/authentification_service.dart';
import 'package:food_order_app/application/dummy_data.dart';
import 'package:food_order_app/model/image_urls_utils.dart';
import 'package:food_order_app/presentation/screens/abstract_screens/carousel_screen.dart';
import 'package:food_order_app/presentation/widgets/auth_widgets/food_app_form_field.dart';
import 'package:food_order_app/presentation/widgets/auth_widgets/form_button.dart';
import 'package:food_order_app/routers/auth_router.dart';
import 'package:food_order_app/utils/ui_helpers/form_field_type_utils.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class LoginScreen extends CarouselScreen {
  LoginScreen()
      : super(
          imageUrls: ImageUrlUtils.loginScreenImages,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends CarouselScreenState<LoginScreen> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

  Future<void> _login() async {
    final bool isFormDataValid = _formKey.currentState!.validate();
    if (isFormDataValid) {
      changeLoadingStatus();
      try {
        await AuthentificationService.login(
            _mailController.text, _passwordController.text);
      } catch (e) {}
      changeLoadingStatus();
    }
  }

  @override
  Widget? child() {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Container(
      margin: EdgeInsetsHelper.mostlyHorizontalDefaultEdgeInsets(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Body
            SizedBoxUiHelper.defaultSizedBox(),
            Center(
              child: Text(
                "Welcome Back",
                style: textTheme.titleLarge,
              ),
            ),
            SizedBoxUiHelper.smallSizedBox(),
            Center(
              child: Text(
                "Login to your account",
                style: textTheme.bodyLarge,
              ),
            ),

            SizedBoxUiHelper.defaultSizedBox(),

            FoodAppFormField(
              textFiledType: TextFiledType.email,
              controller: _mailController,
              themeData: themeData,
            ),

            SizedBoxUiHelper.verySmallSizedBox(),

            FoodAppFormField(
              textFiledType: TextFiledType.password,
              controller: _passwordController,
              themeData: themeData,
            ),
            SizedBoxUiHelper.defaultSizedBox(),

            if (_isLoading) ...[
              const CircularProgressIndicator(),
              SizedBoxUiHelper.defaultSizedBox(),
            ],

            ///Login Button
            FormButton(
              onPressed: () {},
              title: "Log in",
            ),

            /// Forgot your password
            TextButton(
              onPressed: () {
                print("Forgot your password");
                print(DummyData.loggedInUser?.username);
              },
              child: const Text(
                "Forgot your password?",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have any account",
                  style: textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AuthPages.register.routeName());

                    // Navigator.of(context).pushReplacementNamed(
                    //     UserPages.exploration.routeName());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: themeData.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
