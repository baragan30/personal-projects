import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/primitive_widgets/macro_bar.dart';

class EditDomainItem extends StatefulWidget {
  EditDomainItem({
    Key? key,
    required this.miniHabitDomain,
    required this.miniHabitData,
    required this.deleteMinihabitDomain,
    this.isEditing = false,
  }) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  final MiniHabitDomain miniHabitDomain;
  final MiniHabitData miniHabitData;
  final Function deleteMinihabitDomain;
  bool isEditing;

  @override
  State<EditDomainItem> createState() => _EditDomainItemState();
}

class _EditDomainItemState extends State<EditDomainItem> {
  void _saveNameDomain() {
    setState(() {
      widget.miniHabitDomain.setName(widget.textEditingController.text);
      widget.isEditing = false;
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  void _startEditting() {
    setState(() {
      widget.isEditing = true;
      widget.textEditingController.text = widget.miniHabitDomain.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double iconSize = 38;
    const double editIconSize = 30;
    return MacroBar(
      child: Row(
        children: [
          //Delete Button
          IconButton(
            onPressed: () {
              widget.deleteMinihabitDomain(widget.miniHabitDomain);
            },
            iconSize: iconSize,
            color: theme.colorScheme.background,
            icon: const Icon(Icons.cancel),
          ),

          //The Title
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isEditing
                      ? Expanded(
                          child: TextField(
                            autofocus: true,
                            showCursor: true,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.black,
                            // mouseCursor: MouseCursor(),
                            maxLines: null,
                            controller: widget.textEditingController,
                            onSubmitted: (_) {},
                          ),
                        )
                      : Text(
                          widget.miniHabitDomain.name,
                          style: theme.textTheme.headline2,
                          overflow: TextOverflow.visible,
                        ),

                  //Arrow Button
                  IconButton(
                    onPressed:
                        widget.isEditing ? _saveNameDomain : _startEditting,
                    icon: Icon(
                      (widget.isEditing) ? Icons.save : Icons.edit,
                      color: theme.colorScheme.secondary,
                      size: editIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
