import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/widgets/primitive_widgets/text_field.dart';

class MiniHabitAddItem extends StatefulWidget {
  final Function addMiniHabit;
  bool isEditing = false;
  final TextEditingController controller = TextEditingController();

  MiniHabitAddItem({Key? key, required this.addMiniHabit}) : super(key: key);

  @override
  _MiniHabitAddItemState createState() => _MiniHabitAddItemState();
}

class _MiniHabitAddItemState extends State<MiniHabitAddItem> {
  _editMiniHabit() {
    widget.controller.text = "";
    setState(() {
      widget.isEditing = !widget.isEditing;
    });
  }

  _submitData() {
    //isEditin get false value at rerendering
    if (widget.controller.text != "") {
      widget.addMiniHabit(MiniHabit(
          description: widget.controller.text, stage: MiniHabitStage.active));
    }
  }

  Widget _getEditWidget() {
    const double iconSize = 40 / 1.6;
    return Row(children: [
      //MiniHabit Description
      TextFieldBar(controller: widget.controller, submitData: _submitData),

      //Save Data Button
      IconButton(
        onPressed: _submitData,
        iconSize: iconSize,
        icon: const Icon(Icons.save_outlined),
      ),

      //Delete Button
      IconButton(
        onPressed: _editMiniHabit,
        iconSize: iconSize,
        icon: const Icon(Icons.delete_forever),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double height = 25;
    const double iconSize = 25;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(height),
      ),
      child: (widget.isEditing)
          ? _getEditWidget()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!widget.isEditing)
                  Expanded(
                    child: IconButton(
                        onPressed: _editMiniHabit,
                        iconSize: iconSize,
                        icon: const Icon(Icons.add_box)),
                  ),
              ],
            ),
    );
  }
}
