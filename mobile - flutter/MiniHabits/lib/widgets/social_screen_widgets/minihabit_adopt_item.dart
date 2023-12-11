import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';

class MiniHabitAdoptItem extends StatelessWidget {
  final MiniHabit specialistMiniHabit;
  final MiniHabitData userMiniHabitData;

  MiniHabitAdoptItem({
    required this.specialistMiniHabit,
    required this.userMiniHabitData,
  });

  void _adoptMiniHabit(String miniHabitDomain) {
    userMiniHabitData.adoptMiniHabit(miniHabitDomain, specialistMiniHabit);
    MiniHabitsDataService.updateMiniHabitData(userMiniHabitData);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double height = 30;
    const double iconSize = 30;
    String? selectedValue;

    //build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(height),
      ),
      child: Row(
        children: [
          ///MiniHabit Description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 1, 4),
              child: Text(
                specialistMiniHabit.description,
                style: theme.textTheme.bodyText1,
              ),
            ),
          ),

          DropdownButtonHideUnderline(
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              child: DropdownButton2(
                customButton: const Icon(
                  Icons.add_circle_outline,
                  size: iconSize,
                ),
                items: userMiniHabitData
                    .getDomainsNames()
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                value: selectedValue,
                onChanged: (miniHabitDomain) {
                  _adoptMiniHabit(miniHabitDomain as String);
                },
                dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: theme.colorScheme.secondary,
                ),
                dropdownWidth: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
