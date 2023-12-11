class User {
  String name;
  int points;
  double goal;
  double curentStatus;

  User(this.name, this.points, this.goal, this.curentStatus);

  getGoalPercentage() {
    return curentStatus / goal;
  }
}
