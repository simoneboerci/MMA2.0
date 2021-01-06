import '../assets/asset_list.dart';

import '../mmc/func/base/mmc_func.dart';
import '../mmc/func/default_mmc_func.dart';

class MoneyManagementCalculator{

  //Public Variables

  static MoneyManagementCalculator instance;

  //Private Variables

  MMCFunc _func = DefaultMMCFunc.defaultSettings();

  MoneyManagementCalculator(){
    if(instance == null)
      instance = this;
  }

  //Public Methods

  AssetList run(double amount){
    return _func.run(amount);
  }

  //Getters

  void setMMCFunc(MMCFunc func) => _func = func;
}