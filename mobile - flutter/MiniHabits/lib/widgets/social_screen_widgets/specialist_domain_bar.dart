import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/macro_bar.dart';
import 'package:mini_habits/widgets/social_screen_widgets/minihabit_adopt_item.dart';

class SpecialistDomainBar extends StatefulWidget {
  final MiniHabitDomain miniHabitDomain;
  final MiniHabitData userMiniHabitdata;

  SpecialistDomainBar({
    required this.miniHabitDomain,
    required this.userMiniHabitdata,
  });

  @override
  State<SpecialistDomainBar> createState() => _SpecialistDomainBarState();
}

class _SpecialistDomainBarState extends State<SpecialistDomainBar> {
  void _adoptMiniHabit(MiniHabit miniHabit, String miniHabitDomain) {
    widget.userMiniHabitdata.adoptMiniHabit(miniHabitDomain, miniHabit);
    MiniHabitsDataService.updateMiniHabitData(widget.userMiniHabitdata);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double iconHeight = 35;
    final miniHabits = [
      ...widget.miniHabitDomain.actives,
      ...widget.miniHabitDomain.pasives
    ];
    return MacroBar(
      seeDopDownElement: widget.miniHabitDomain.seeMiniHabitsList,
      dropDownElement: Column(
        children: miniHabits
            .map(
              (miniHabit) => MiniHabitAdoptItem(
                  specialistMiniHabit: miniHabit,
                  userMiniHabitData: widget.userMiniHabitdata),
            )
            .toList(),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            widget.miniHabitDomain.toggleSeeMinihabitsList();
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle,
              size: iconHeight,
              color: widget.miniHabitDomain.isActive()
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.tertiary,
            ),
            //Domain Name
            Expanded(
              child: Container(
                //This container can be deleted
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.miniHabitDomain.name,
                  style: theme.textTheme.headline2,
                ),
              ),
            ),

            //Arrow Button
            Icon(
              (!widget.miniHabitDomain.seeMiniHabitsList)
                  ? Icons.arrow_drop_down
                  : Icons.arrow_drop_up,
              color: theme.colorScheme.secondary,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
