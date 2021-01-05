import 'package:flutter/material.dart';

import '../models/assets/asset_list.dart';
import '../models/managers/money_management_calculator.dart';

import 'mmc_settings_screen.dart';

class CalculatorScreen extends StatefulWidget{
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final TextEditingController _textEditingController = TextEditingController();

  AssetList _assetList;
  String _debugString = "";

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
                _assetList = MoneyManagementCalculator.instance.run(double.tryParse(text));
                _debugString = "Main Card: ${_assetList.mainCard().money.toStringAsFixed(2)} \n Personal Card: ${_assetList.personalCard().money.toStringAsFixed(2)} \n Business Card: ${_assetList.businessCard().money.toStringAsFixed(2)} \n\n Investments Account: ${_assetList.investmentsAccount().money.toStringAsFixed(2)} \n Speculation Account: ${_assetList.speculationAccount().money.toStringAsFixed(2)} \n Savings Account: ${_assetList.savingsAccount().money.toStringAsFixed(2)} \n Bonus Account: ${_assetList.bonusAccount().money.toStringAsFixed(2)} \n\n Check: ${_assetList.assetValue().toStringAsFixed(2)}";
              });
            },
          ),
          SizedBox(height: 10,),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MMCSettingsScreen()
                ),
              );
            },
            child: Text("MMC Settings"),
          ),
        ],
      ),
    );
  }
}