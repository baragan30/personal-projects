class MiniHabit {
  String description;
  MiniHabitStage stage;
  MiniHabit({required this.description, required this.stage});
  factory MiniHabit.fromJson(Map<String, dynamic> json) {
    return MiniHabit(
        description: json['description'],
        stage: MiniHabitStage.values
            .firstWhere((stage) => stage.toString() == json['stage']));
  }
  bool isActive() {
    return this.stage == MiniHabitStage.active;
  }

  bool isIdle() {
    return this.stage == MiniHabitStage.idle;
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'stage': stage.toString(),
      };
}

enum MiniHabitStage { active, idle }
