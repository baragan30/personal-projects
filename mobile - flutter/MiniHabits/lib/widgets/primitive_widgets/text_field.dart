import 'package:flutter/material.dart';

class TextFieldBar extends StatelessWidget {
  TextEditingController controller;
  VoidCallback submitData;
  TextFieldBar({Key? key, required this.controller, required this.submitData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                onSubmitted: (_) {
                  submitData();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
