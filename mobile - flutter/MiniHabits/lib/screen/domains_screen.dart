import 'package:flutter/material.dart';
import 'package:mini_habits/model/MiniHabit.dart';
import 'package:mini_habits/model/MiniHabitDomain.dart';
import 'package:mini_habits/model/MiniHabitsData.dart';
import 'package:mini_habits/services/mini_habit_data_service.dart';
import 'package:mini_habits/widgets/domains_screen_widgets/DomainItem.dart';
import 'package:mini_habits/widgets/domains_screen_widgets/EditDomainItem.dart';

class DomainScreen extends StatefulWidget {
  MiniHabitData miniHabitData;
  bool isEditDomain;
  VoidCallback toggleEditDomainState;

  DomainScreen(
      {required this.miniHabitData,
      required this.isEditDomain,
      required this.toggleEditDomainState,
      Key? key})
      : super(key: key);

  @override
  State<DomainScreen> createState() => DomainScreenState();
}

class DomainScreenState extends State<DomainScreen> {
  Widget getDomainItem(ctx, index, List<MiniHabitDomain> domainsList) {
    return DomainItem(
        miniHabitDomain: domainsList[index],
        miniHabitData: widget.miniHabitData);
  }

  Widget getEditDomainItem(ctx, index, List<MiniHabitDomain> domainsList) {
    return EditDomainItem(
      miniHabitDomain: domainsList[index],
      miniHabitData: widget.miniHabitData,
      deleteMinihabitDomain: _deleteMinihabitDomain,
    );
  }

  addNewDomain() {
    setState(() {
      widget.miniHabitData.pasives.add(MiniHabitDomain(
          name: "", stage: MiniHabitStage.idle, actives: [], pasives: []));
    });
  }

  void _deleteMinihabitDomain(MiniHabitDomain miniHabitDomain) {
    setState(() {
      widget.miniHabitData.deleteDomain(miniHabitDomain);
    });
    MiniHabitsDataService.updateMiniHabitData(widget.miniHabitData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final domainsList = [
      ...widget.miniHabitData.actives,
      ...widget.miniHabitData.pasives
    ];
    builderFuntion(ctx, index) => widget.isEditDomain
        ? getEditDomainItem(ctx, index, domainsList)
        : getDomainItem(ctx, index, domainsList);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edit domains",
              style: theme.textTheme.headline3,
            ),
            Switch(
              activeColor: theme.colorScheme.secondary,
              value: widget.isEditDomain,
              onChanged: (newValue) {
                setState(() {
                  widget.toggleEditDomainState();
                });
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 100),
            itemBuilder: builderFuntion,
            itemCount: domainsList.length,
          ),
        ),
      ],
    );
  }
}
