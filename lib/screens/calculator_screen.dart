import 'package:flutter/material.dart';

import '../models/assets/asset_list.dart';
import '../models/mmc/percentage.dart';
import '../models/mmc/percentage_sheet.dart';
import '../models/managers/money_management_calculator.dart';

class CalculatorScreen extends StatefulWidget{

  final Percentage _commission = Percentage("Commission", 6, 5, 15);
  final Percentage _cashback = Percentage("Cashback", 50, 20, 50);
  final Percentage _savings = Percentage("Savings", 20, 20, 60);
  final Percentage _business = Percentage("Business", 70, 20, 70);
  final Percentage _investments = Percentage("Investments", 74, 50, 90);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState(PercentageSheet(_commission, _cashback, _savings, _business, _investments));
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final TextEditingController _textEditingController = TextEditingController();

  final PercentageSheet _percentageSheet;

  MoneyManagementCalculator _mmc;
  AssetList _assetList;

  String _debugString = "";

  _CalculatorScreenState(this._percentageSheet);

  @override
  void initState() {
    if(_mmc == null)
      _mmc = new MoneyManagementCalculator(_percentageSheet);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_debugString),
          SizedBox(height: 10,),
          TextFormField(
            controller: _textEditingController,
            onFieldSubmitted: (text){
              setState(() {
                _assetList = _mmc.run(double.tryParse(text));
                _debugString = "Main Card: ${_assetList.mainCard().money.toStringAsFixed(2)} \n Personal Card: ${_assetList.personalCard().money.toStringAsFixed(2)} \n Business Card: ${_assetList.businessCard().money.toStringAsFixed(2)} \n\n Investments Account: ${_assetList.investmentsAccount().money.toStringAsFixed(2)} \n Speculation Account: ${_assetList.speculationAccount().money.toStringAsFixed(2)} \n Savings Account: ${_assetList.savingsAccount().money.toStringAsFixed(2)} \n Bonus Account: ${_assetList.bonusAccount().money.toStringAsFixed(2)} \n\n Check: ${_assetList.assetValue().toStringAsFixed(2)}";
              });
            },
          ),
        ],
      ),
    );
  }
}