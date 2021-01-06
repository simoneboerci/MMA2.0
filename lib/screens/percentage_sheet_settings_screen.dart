import 'package:flutter/material.dart';

import '../widgets/percentage_edit_widget.dart';

import '../models/managers/mmc_functions.dart';

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
          PercentageEditWidget(MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.commission()),
          PercentageEditWidget(MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.cashback()),
          PercentageEditWidget(MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.savings()),
          PercentageEditWidget(MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.business()),
          PercentageEditWidget(MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.investments()),
          RaisedButton(
            child: Text("Reset"),
            onPressed: (){
              setState(() {
                MMCFunctions.instance.defaultMMCFunc.settings.percentageSheet.resetValues();
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