import 'package:flutter/material.dart';

import '../widgets/percentage_edit_widget.dart';

import '../models/managers/mmc_functions.dart';

class PercentageMMCFuncSettingsScreen extends StatefulWidget{
  @override
  _PercentageMMCFuncSettingsScreenState createState() => _PercentageMMCFuncSettingsScreenState();
}

class _PercentageMMCFuncSettingsScreenState extends State<PercentageMMCFuncSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PercentageEditWidget(MMCFunctions.percentageMMCFunc.settings.percentageSheet.commission()),
          PercentageEditWidget(MMCFunctions.percentageMMCFunc.settings.percentageSheet.cashback()),
          PercentageEditWidget(MMCFunctions.percentageMMCFunc.settings.percentageSheet.savings()),
          PercentageEditWidget(MMCFunctions.percentageMMCFunc.settings.percentageSheet.business()),
          PercentageEditWidget(MMCFunctions.percentageMMCFunc.settings.percentageSheet.investments()),
          RaisedButton(
            child: Text("Reset"),
            onPressed: (){
              setState(() {
                MMCFunctions.percentageMMCFunc.settings.percentageSheet.resetValues();
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