import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/widgets/social_screen_widgets/specialist_domain_bar.dart';

class SpecialistMiniHabitScreen extends StatelessWidget {
  MiniHabitData userMiniHabitdata;
  MiniHabitData specialistMiniHabitData;

  SpecialistMiniHabitScreen(
      this.userMiniHabitdata, this.specialistMiniHabitData);

  @override
  Widget build(BuildContext context) {
    final domainsList = [
      ...specialistMiniHabitData.actives,
      ...specialistMiniHabitData.pasives
    ];
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (ctx, index) {
        return SpecialistDomainBar(
          miniHabitDomain: domainsList[index],
          userMiniHabitdata: userMiniHabitdata,
        );
      },
      itemCount: domainsList.length,
    );
  }
}
