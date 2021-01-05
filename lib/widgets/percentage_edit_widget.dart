import 'package:flutter/material.dart';

import '../models/mmc/percentage.dart';

class PercentageEditWidget extends StatefulWidget{

  final Percentage _percentage;

  PercentageEditWidget(this._percentage);

  @override
  _PercentageEditWidgetState createState() => _PercentageEditWidgetState();
}

class _PercentageEditWidgetState extends State<PercentageEditWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton.icon(
            icon: Icon(Icons.west),
            label: Text("Subtract"),
            onPressed: (){
              setState(() {
                widget._percentage.setValue(widget._percentage.value() - 1);
              });
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget._percentage.name),
              Text("${widget._percentage.minValue().toStringAsFixed(0)} < ${widget._percentage.value().toStringAsFixed(0)} < ${widget._percentage.maxValue().toStringAsFixed(0)}")
            ],
          ),
          FlatButton.icon(
            icon: Text("Add"),
            label: Icon(Icons.east),
            onPressed: (){
              setState(() {
                widget._percentage.setValue(widget._percentage.value() + 1);
              });
            },
          ),
        ],
      ),
    );
  }
}