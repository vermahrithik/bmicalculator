import 'dart:math';

class BmiLogic {
  BmiLogic({required this.height, required this.weight});

  final int height;
  final int weight;

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi == null) return 'Unknown';
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getSuggestion() {
    if (_bmi == null) return 'Unknown';
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight.\nTry to exercise more.';
    } else if (_bmi! >= 18.5) {
      return 'You have a normal body weight. \nGood job!';
    } else {
      return 'You have a lower than normal body weight.\nYou can eat a bit more.';
    }
  }
}
