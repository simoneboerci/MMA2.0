import 'package:flutter/material.dart';

import '../models/assets/asset_list.dart';
import '../models/mmc/percentage.dart';
import '../models/mmc/percentage_sheet.dart';
import '../models/managers/money_management_calculator.dart';

class CalculatorScreen extends StatelessWidget{

  final Percentage _commission = Percentage("Commission", 6, 5, 15);
  final Percentage _cashback = Percentage("Cashback", 50, 20, 50);
  final Percentage _savings = Percentage("Savings", 20, 20, 60);
  final Percentage _business = Percentage("Business", 70, 20, 70);
  final Percentage _investments = Percentage("Investments", 74, 50, 90);

  @override
  Widget build(BuildContext context) {

    PercentageSheet _percentageSheet = PercentageSheet(_commission, _cashback, _savings, _business, _investments);
    MoneyManagementCalculator _mmc = MoneyManagementCalculator(_percentageSheet);
    AssetList _assetList = _mmc.run(1500);

    String _debugString = "Main Card: ${_assetList.mainCard().money.toStringAsFixed(2)} \n Personal Card: ${_assetList.personalCard().money.toStringAsFixed(2)} \n Business Card: ${_assetList.businessCard().money.toStringAsFixed(2)} \n\n Investments Account: ${_assetList.investmentsAccount().money.toStringAsFixed(2)} \n Speculation Account: ${_assetList.speculationAccount().money.toStringAsFixed(2)} \n Savings Account: ${_assetList.savingsAccount().money.toStringAsFixed(2)} \n Bonus Account: ${_assetList.bonusAccount().money.toStringAsFixed(2)} \n\n Check: ${_assetList.assetValue().toStringAsFixed(2)}";

    return Scaffold(
      body: Center(
        child: Text(_debugString),
      ),
    );
  }
}