import 'package:mmc/models/mmc/percentage_sheet.dart';

import '../base/mmc_func_settings.dart';

class DefaultMMCFuncSettings extends MMCFuncSettings{

  PercentageSheet percentageSheet;

  DefaultMMCFuncSettings(this.percentageSheet);

  DefaultMMCFuncSettings.defaultSettings() : this(PercentageSheet.defaultSettings());
}