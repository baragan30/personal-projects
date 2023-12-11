import 'MiniHabit.dart';

class MiniHabitDomain {
  MiniHabitDomain(
      {required this.name,
      required this.stage,
      required this.actives,
      required this.pasives,
      this.seeMiniHabitsList = false});

  MiniHabitDomain.withoutLists(
      {required this.name,
      required this.stage,
      this.seeMiniHabitsList = false});
  factory MiniHabitDomain.fromJson(Map<String, dynamic> json) {
    return MiniHabitDomain(
      name: json['name'],
      stage: MiniHabitStage.values
          .firstWhere((stage) => stage.toString() == json['stage']),
      actives: ((json['actives'] as List<dynamic>)
          .map((jsonMiniHabit) => MiniHabit.fromJson(jsonMiniHabit))).toList(),
      pasives: ((json['pasives'] as List<dynamic>)
          .map((jsonMiniHabit) => MiniHabit.fromJson(jsonMiniHabit))).toList(),
      seeMiniHabitsList: json['seeMiniHabitsList'],
    );
  }

  String name;
  MiniHabitStage stage;
  List<MiniHabit> actives = [];
  List<MiniHabit> pasives = [];
  bool seeMiniHabitsList;

  void togleStage(MiniHabit miniHabit) {
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

  void setName(String name) {
    this.name = name;
  }

  void deleteMiniHabit(MiniHabit miniHabit) {
    if (miniHabit.stage == MiniHabitStage.active) {
      actives.remove(miniHabit);
    } else {
      pasives.remove(miniHabit);
    }
  }

  void toggleSeeMinihabitsList() {
    seeMiniHabitsList = !seeMiniHabitsList;
  }

  bool isActive() {
    return this.stage == MiniHabitStage.active;
  }

  bool isIdle() {
    return this.stage == MiniHabitStage.idle;
  }

  void adoptMiniHabit(MiniHabit miniHabit) {
    if (actives.any((habit) => habit.description == miniHabit.description)) {
      return;
    }
    if (pasives.any((habit) => habit.description == miniHabit.description)) {
      return;
    }
    if (miniHabit.isActive()) {
      actives.add(miniHabit);
    } else {
      pasives.add(miniHabit);
    }
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'stage': stage.toString(),
        'actives': actives.map((e) => e.toJson()).toList(),
        'pasives': pasives.map((e) => e.toJson()).toList(),
        'seeMiniHabitsList': seeMiniHabitsList,
      };
}
