import '../mmc/func/default_mmc_func.dart';
import '../mmc/func/equal_distribution_mmc_func.dart';

class MMCFunctions{

  static MMCFunctions instance;

  DefaultMMCFunc defaultMMCFunc = DefaultMMCFunc.defaultSettings();
  EqualDistributionMMCFunc equalDistributionMMCFunc = EqualDistributionMMCFunc();

  MMCFunctions(){
    if(instance == null)
      instance = this;
  }
}