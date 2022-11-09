import 'dart:math';

import 'package:bmi_calculator/screens/input_page.dart';

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
String calculator(){
   _bmi=weight/pow(height/100, 2);
   return _bmi.toStringAsFixed(1);
}
  String getResult(){
  if(_bmi>=25)
    return'overweight';
  else if(_bmi>18.5)
    return'normal';
  else
    return 'underweight';
  }
  String getAdvice(){
    if(_bmi>=25)
      return'you need to do more exercise and stick to a diet';
    else if(_bmi>18.5)
      return'your body is perfect try to maitain this perfectionism ';
    else
      return 'you need to stick on a diet and make some muscles';
  }


}