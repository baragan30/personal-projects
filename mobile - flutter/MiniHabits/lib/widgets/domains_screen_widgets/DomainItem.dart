import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/macro_bar.dart';

import '../../model/MiniHabitDomain.dart';
import '../primitive_widgets/check_button.dart';
import 'MiniHabitsList.dart';

class DomainItem extends StatefulWidget {
  //The Bar that display the Domain in ChooseDomainScreens and ChooseMiniHabitsScreen
  //And its miniHabitList
  final MiniHabitDomain miniHabitDomain;
  final MiniHabitData miniHabitData;

  DomainItem({
    required this.miniHabitDomain,
    required this.miniHabitData,
  });

  @override
  _DomainItemState createState() => _DomainItemState();
}

class _DomainItemState extends State<DomainItem> {
  void _showDomainMiniHabits() {
    setState(() {
      widget.miniHabitDomain.toggleSeeMinihabitsList();
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double iconHeight = 35;
    return MacroBar(
        seeDopDownElement: widget.miniHabitDomain.seeMiniHabitsList,
        dropDownElement: MiniHabitsList(
          miniHabitDomain: widget.miniHabitDomain,
          miniHabitData: widget.miniHabitData,
        ),
        child: Row(
          children: [
            //Check Button
            CheckButton(
              isChecked: widget.miniHabitDomain.isActive(),
              func: () {
                widget.miniHabitData.togleStage(widget.miniHabitDomain);
                MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
              },
            ),

            //The Title
            Expanded(
              child: TextButton(
                onPressed: _showDomainMiniHabits,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.miniHabitDomain.name,
                      style: theme.textTheme.headline2,
                      overflow: TextOverflow.visible,
                    ),

                    //Arrow Button
                    Icon(
                      (!widget.miniHabitDomain.seeMiniHabitsList)
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      color: theme.colorScheme.secondary,
                      size: iconHeight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
