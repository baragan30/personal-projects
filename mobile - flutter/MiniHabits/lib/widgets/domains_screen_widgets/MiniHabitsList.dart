import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/domains_screen_widgets/MiniHabitAddItem.dart';
import 'package:mini_habits/widgets/domains_screen_widgets/MiniHabitItem.dart';

class MiniHabitsList extends StatefulWidget {
  final MiniHabitDomain miniHabitDomain;
  final MiniHabitData miniHabitData;
  const MiniHabitsList({
    required this.miniHabitDomain,
    required this.miniHabitData,
  });

  @override
  _MiniHabitsListState createState() => _MiniHabitsListState();
}

class _MiniHabitsListState extends State<MiniHabitsList> {
  _refreshMiniHabitList(Function function) {
    setState(() {
      function();
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  void _addNewMiniHabit(MiniHabit miniHabit) {
    setState(() {
      widget.miniHabitDomain.actives.add(miniHabit);
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  @override
  Widget build(BuildContext context) {
    final miniHabits = [
      ...widget.miniHabitDomain.actives,
      ...widget.miniHabitDomain.pasives
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(children: [
        ...miniHabits
            .map((habit) => MiniHabitItem(
                  miniHabit: habit,
                  miniHabitData: widget.miniHabitData,
                  miniHabitDomain: widget.miniHabitDomain,
                  refreshMiniHabitList: _refreshMiniHabitList,
                ))
            .toList(),
        MiniHabitAddItem(
          addMiniHabit: _addNewMiniHabit,
        )
      ]),
    );
  }
}
