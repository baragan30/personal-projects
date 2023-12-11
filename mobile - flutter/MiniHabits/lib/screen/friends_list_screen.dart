import 'package:flutter/material.dart';
import 'package:mini_habits/model/user.dart';
import 'package:mini_habits/widgets/primitive_widgets/macro_bar.dart';

class SpecialistListScreen extends StatefulWidget {
  Function viewSpecialistMiniHabit;
  List<AppUser> specialistList;

  SpecialistListScreen(this.viewSpecialistMiniHabit, this.specialistList);

  @override
  State<SpecialistListScreen> createState() => _SpecialistListScreenState();
}

class _SpecialistListScreenState extends State<SpecialistListScreen> {
  @override
  Widget build(BuildContext context) {
    const double height = 60;
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (ctx, index) {
        final specialist = widget.specialistList[index];
        return MacroBar(
          child: Row(children: [
            //The Title
            Expanded(
              child: FlatButton(
                onPressed: () {
                  widget.viewSpecialistMiniHabit(specialist);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        //This container can be deleted
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          specialist.username,
                          style: theme.textTheme.headline2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
      itemCount: widget.specialistList.length,
    );
  }
}
