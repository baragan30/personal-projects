import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField(
      {required this.labelText,
      required this.validator,
      required this.onSaved,
      this.isPasswordLabel = false,
      this.initialValue = "",
      Key? key})
      : super(key: key);

  String labelText;
  bool isPasswordLabel;
  FormFieldValidator<String> validator;
  FormFieldSetter<String> onSaved;
  String initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
        enableSuggestions: false,
        keyboardType: TextInputType.emailAddress,
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: labelText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).textTheme.headline1!.color!,
                  width: 1.0),
            ),
            enabledBorder: null),
        obscureText: isPasswordLabel,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
