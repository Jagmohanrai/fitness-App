
class Human extends _Human{
  final int height;
  final int weight;
  final int age;
  final int activityLevel;
  final String gender;
  final String goal;
  double _bmr = 0.0;
  int _drc = 0;
  int _kalGoal = 0;

  Human(this.height, this.weight, this.age, this.activityLevel, this.gender,
      this.goal) {
   
    drc();
    switch (goal) {
      case 'gain':
      // _kalGoal = _drc
        break;
      case 'maintain':
        break;
      case 'loose':
        break;
      default:
    }
  }

  int calculateBMR(){
     if (gender == 'male' || gender == 'Male') {
      _bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
    } else {
      _bmr = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    }
   return  0;
   
  }
   int drc() {
    switch (activityLevel) {
      case 1:
        _drc = (_bmr * 1.2).toInt();
        return _drc;
        break;
      case 2:
        _drc = (_bmr * 1.375).toInt();
        return _drc;
        break;
      case 3:
        _drc = (_bmr * 1.55).toInt();
        return _drc;
        break;
      case 4:
        _drc = (_bmr * 1.725).toInt();
        return _drc;
        break;
      default:
        return 0;
    }
  }

  double get bmr {
    return _bmr;
  }
}
class _Human{

}
