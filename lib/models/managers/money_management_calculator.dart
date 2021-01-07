import '../assets/asset_list.dart';

import '../mmc/func/base/mmc_func.dart';
import 'mmc_functions.dart';

class MoneyManagementCalculator{

  //Public Variables

  static MoneyManagementCalculator instance;

  //Private Variables

  MMCFunc _defaultFunc = MMCFunctions.percentageMMCFunc;
  MMCFunc _func;

  MoneyManagementCalculator(){
    if(instance == null)
      instance = this;

    this._func = _defaultFunc;
  }

  //Public Methods

  AssetList run(double amount){
    return _func.run(amount);
  }

  //Getters

  void setMMCFunc(MMCFunc func) => _func = func;
}