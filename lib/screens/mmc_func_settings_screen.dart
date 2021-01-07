import 'package:flutter/material.dart';

import 'percentage_sheet_settings_screen.dart';

class MMCFuncSettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            onPressed: null,
            child: Text("Equal Distribution Function Settings"),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PercentageMMCFuncSettingsScreen())
              );
            },
            child: Text("Percentage Function Settings"),
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