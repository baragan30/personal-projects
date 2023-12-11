import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/services/user_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/rounded_container.dart';

class ShareYourMinihabitsSwitch extends StatefulWidget {
  ShareYourMinihabitsSwitch({required this.appUser, Key? key})
      : super(key: key);
  AppUser appUser;

  @override
  State<ShareYourMinihabitsSwitch> createState() =>
      _ShareYourMinihabitsSwitchState();
}

class _ShareYourMinihabitsSwitchState extends State<ShareYourMinihabitsSwitch> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Share your minihabits with your friends',
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
          Switch(
            activeColor: theme.colorScheme.secondary,
            value: widget.appUser.isSpecialist(),
            onChanged: (newValue) {
              setState(() {
                widget.appUser.toggleUserType();
              });
              AppUserService.updateUser(widget.appUser);
            },
          ),
        ],
      ),
    );
  }
}
