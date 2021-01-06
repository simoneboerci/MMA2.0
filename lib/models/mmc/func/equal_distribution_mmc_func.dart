import 'package:mmc/models/assets/asset_list.dart';

import 'base/mmc_func.dart';

class EqualDistributionMMCFunc extends MMCFunc{
  @override
  AssetList run(double amount) {
    _setup();
    _distributeMoney(amount);
    _evaluateResult(amount);
    return assetList;
  }

  void _setup(){
    assetList.reset();
  }

  void _distributeMoney(double amount){
    double _percentage = amount / 7;

    assetList.mainCard().money += _percentage;
    assetList.personalCard().money += _percentage;
    assetList.businessCard().money += _percentage;

    assetList.investmentsAccount().money += _percentage;
    assetList.speculationAccount().money += _percentage;
    assetList.savingsAccount().money += _percentage;
    assetList.bonusAccount().money += _percentage;
  }

  void _evaluateResult(double amount){
    double _leftovers = amount - assetList.assetValue();

    if(_leftovers > 0)
      assetList.bonusAccount().money += _leftovers;
    else if(_leftovers < 0)
      assetList.bonusAccount().money -= _leftovers;
  }
}