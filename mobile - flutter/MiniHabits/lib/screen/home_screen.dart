import 'package:flutter/material.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';

import '../model/MiniHabitsData.dart';

class HomeScreen extends StatefulWidget {
  final MiniHabitData miniHabitData;
  const HomeScreen(this.miniHabitData);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double _circleDiameter = 180;
  void _changeDisplay() {
    setState(() {
      widget.miniHabitData.toggleDisplaytask();
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double padding = 10;

    Widget _getButton({required String text, required VoidCallback onPressed}) {
      return FlatButton(
        onPressed: onPressed,
        child: Container(
          width: 100,
          height: 40,
          padding: const EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            text,
            style: theme.textTheme.titleMedium,
          )),
        ),
      );
    }

    return

        /// Display MiniHabit
        Center(
            child: widget.miniHabitData.displayTask
                ?
                //Display MiniHabit
                Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Mini Habit Widget
                        Container(
                          // width: 300,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.miniHabitData.curentTask!.description,
                            style: theme.textTheme.headline2,
                          ),
                        ),
                        const SizedBox(height: 40),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _getButton(text: "Done", onPressed: _changeDisplay),
                            const SizedBox(width: 25),
                            _getButton(text: "Skip", onPressed: _changeDisplay)
                          ],
                        )
                      ],
                    ),
                  )

                ///Go Button
                : Container(
                    width: _circleDiameter,
                    height: _circleDiameter,
                    child: RawMaterialButton(
                      onPressed: () {
                        widget.miniHabitData.updateCurentTask();
                        _changeDisplay();
                      },
                      elevation: 2.0,
                      fillColor: theme.colorScheme.secondary,
                      shape: const CircleBorder(),
                      child: Text(
                        'GO',
                        style: theme.textTheme.headline1,
                      ),
                    ),
                  ));

    //Display Go Button
  }
}
