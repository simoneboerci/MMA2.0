import 'percentage_sheet.dart';

class MMCSettings{

  //Public Variables

  PercentageSheet percentageSheet;

  MMCSettings(this.percentageSheet);

  MMCSettings.defaultSettings() : this(
    PercentageSheet.defaultSettings()
  );
}