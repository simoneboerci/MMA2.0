import 'package:flutter/material.dart';

import '../models/managers/money_management_calculator.dart';

import '../widgets/percentage_edit_widget.dart';

class PercentageSheetSettingsScreen extends StatefulWidget{
  @override
  _PercentageSheetSettingsScreenState createState() => _PercentageSheetSettingsScreenState();
}

class _PercentageSheetSettingsScreenState extends State<PercentageSheetSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PercentageEditWidget(MoneyManagementCalculator.instance.mmcSettings.percentageSheet.commission()),
          PercentageEditWidget(MoneyManagementCalculator.instance.mmcSettings.percentageSheet.cashback()),
          PercentageEditWidget(MoneyManagementCalculator.instance.mmcSettings.percentageSheet.savings()),
          PercentageEditWidget(MoneyManagementCalculator.instance.mmcSettings.percentageSheet.business()),
          PercentageEditWidget(MoneyManagementCalculator.instance.mmcSettings.percentageSheet.investments()),
          RaisedButton(
            child: Text("Reset"),
            onPressed: (){
              setState(() {
                MoneyManagementCalculator.instance.mmcSettings.percentageSheet.resetValues();
              });
            },
          ),
          RaisedButton(
            child: Text("Back"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}