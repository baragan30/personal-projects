import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/text_bar.dart';
import 'package:mini_habits/widgets/primitive_widgets/text_field.dart';

class MiniHabitItem extends StatefulWidget {
  late final MiniHabit miniHabit;
  late final MiniHabitDomain miniHabitDomain;
  final Function refreshMiniHabitList;
  final controller = TextEditingController();
  final MiniHabitData miniHabitData;

  bool showFullText = false;
  bool isEditing = false;

  MiniHabitItem({
    required this.miniHabit,
    required this.miniHabitData,
    required this.miniHabitDomain,
    required this.refreshMiniHabitList,
  });
  @override
  _MiniHabitItemState createState() => _MiniHabitItemState();
}

class _MiniHabitItemState extends State<MiniHabitItem> {
  ///change state of this Mini Habit
  _changeMiniHabitState() {
    setState(() {
      widget.miniHabitDomain.togleStage(widget.miniHabit);
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  _submitData() {
    setState(() {
      widget.isEditing = false;
      widget.miniHabit.description = widget.controller.text;
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  _deleteMiniHabit() {
    widget.miniHabitDomain.deleteMiniHabit(widget.miniHabit);
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  _editMiniHabit() {
    setState(() {
      widget.isEditing = true;
      widget.controller.text = widget.miniHabit.description;
    });
  }

  _toogleTextOverflow() {
    setState(() {
      widget.showFullText = !widget.showFullText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const double height = 30;
    const double iconSize = 25;
    //build
    return Container(
      // height: height,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.miniHabit.isActive()
            ? theme.colorScheme.secondary
            : theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(height),
      ),
      child: Row(
        children: [
          ///MiniHabit Description
          widget.isEditing
              ? TextFieldBar(
                  controller: widget.controller,
                  submitData: _submitData,
                )
              : TextBar(
                  text: widget.miniHabit.description,
                  showFullText: widget.showFullText,
                  onLongPressed: _toogleTextOverflow,
                  onPressed: _changeMiniHabitState,
                ),

          //Edit Button
          IconButton(
              onPressed: widget.isEditing ? _submitData : _editMiniHabit,
              iconSize: iconSize,
              icon: Icon(widget.isEditing ? Icons.save : Icons.edit)),
          //Delete Button
          IconButton(
              onPressed: () {
                widget.refreshMiniHabitList(_deleteMiniHabit);
              },
              iconSize: iconSize,
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
