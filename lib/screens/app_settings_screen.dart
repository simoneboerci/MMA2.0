import 'package:flutter/material.dart';

class AppSettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlatButton(
            onPressed: null,
            child: Text("Theme"),
          ),
          FlatButton(
            onPressed: null,
            child: Text("Updates"),
          ),
        ],
      ),
    );
  }
}