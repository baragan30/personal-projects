import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'MiniHabit.dart';
import 'MiniHabitDomain.dart';

class MiniHabitData {
  MiniHabitData({
    required this.actives,
    required this.pasives,
    this.displayTask = false,
  });

  MiniHabitData.witUID(
      {required this.actives,
      required this.pasives,
      required this.uid,
      this.displayTask = false,
      this.curentTask});

  factory MiniHabitData.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return MiniHabitData.witUID(
      actives: ((json['actives'] as List<dynamic>)
          .map((jsonDomain) => MiniHabitDomain.fromJson(jsonDomain))).toList(),
      pasives: ((json['pasives'] as List<dynamic>)
          .map((jsonDomain) => MiniHabitDomain.fromJson(jsonDomain))).toList(),
      uid: json.id,
      displayTask: json['displayTask'],
      curentTask: json['curentTask'] == 'null'
          ? null
          : MiniHabit.fromJson(json['curentTask']),
    );
  }

  List<MiniHabitDomain> actives = [];
  List<MiniHabitDomain> pasives = [];
  String? uid;
  MiniHabit? curentTask;
  bool displayTask;

  MiniHabit? updateCurentTask() {
    int totalActiveHabits = 0;
    actives.forEach((domain) {
      totalActiveHabits += domain.actives.length;
    });
    if (totalActiveHabits == 0) {
      curentTask = MiniHabit(
          description: 'No active MiniHabits', stage: MiniHabitStage.active);
      return curentTask;
    }
    Random random = Random();
    int randomMiniHabitIndex = random.nextInt(totalActiveHabits);
    for (int i = 0; i < actives.length; i++) {
      MiniHabitDomain domain = actives[i];
      if (domain.actives.length <= randomMiniHabitIndex) {
        randomMiniHabitIndex -= domain.actives.length;
      } else {
        curentTask = domain.actives[randomMiniHabitIndex];
        return curentTask;
      }
    }
    return null;
  }

  void toggleDisplaytask() {
    displayTask = !displayTask;
  }

  void removeDomain(String domainName) {
    actives.removeWhere((element) => element.name == domainName);
    pasives.removeWhere((element) => element.name == domainName);
  }

  void updateDomain(String domainName, String finalDomainName) {
    actives.where((element) => element.name == domainName).forEach((element) {
      element.name = finalDomainName;
    });
    pasives.where((element) => element.name == domainName).forEach((element) {
      element.name = finalDomainName;
    });
  }

  void togleStage(MiniHabitDomain miniHabit) {
    if (miniHabit.stage == MiniHabitStage.active) {
      miniHabit.stage = MiniHabitStage.idle;
      actives.remove(miniHabit);
      pasives.add(miniHabit);
    } else {
      miniHabit.stage = MiniHabitStage.active;
      actives.add(miniHabit);
      pasives.remove(miniHabit);
    }
  }

  void adoptMiniHabit(String miniHabitDomainName, MiniHabit miniHabit) {
    bool active = actives.any((domain) {
      if (miniHabitDomainName == domain.name) {
        domain.adoptMiniHabit(miniHabit);
        return true;
      }
      return false;
    });
    if (!active) {
      pasives.any((domain) {
        if (miniHabitDomainName == domain.name) {
          domain.adoptMiniHabit(miniHabit);
          return true;
        }
        return false;
      });
    }
  }

  void deleteDomain(MiniHabitDomain miniHabitDomain) {
    if (!actives.remove(miniHabitDomain)) {
      pasives.remove(miniHabitDomain);
    }
  }

  List<String> getDomainsNames() {
    List<String> categoriesName = actives.map((e) => e.name).toList();
    categoriesName.addAll(pasives.map((e) => e.toString()).toList());
    return categoriesName;
  }

  Map<String, dynamic> toJson() => {
        'actives': actives.map((e) => e.toJson()).toList(),
        'pasives': pasives.map((e) => e.toJson()).toList(),
        'displayTask': displayTask,
        'curentTask': (curentTask == null) ? 'null' : curentTask!.toJson(),
      };
}
