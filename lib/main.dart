import 'package:flutter/material.dart';

import 'models/managers/money_management_calculator.dart';

import './screens/calculator_screen.dart';

void main() {

  MoneyManagementCalculator();

  runApp(MainWidget());
}

class MainWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}