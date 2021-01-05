import 'package:mmc/models/assets/asset_list.dart';
import 'package:mmc/models/mmc/func/default_mmc_func_settings.dart';

import 'mmc_func.dart';

class DefaultMMCFunc extends MMCFunc<DefaultMMCFunc>{

  DefaultMMCFuncSettings settings;

  DefaultMMCFunc(this.settings);

  DefaultMMCFunc.defaultSettings() : this(DefaultMMCFuncSettings.defaultSettings());

  @override
  AssetList run(double amount) {

  }
}