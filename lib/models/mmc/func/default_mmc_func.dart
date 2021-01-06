import 'package:mmc/models/assets/asset_list.dart';
import 'file:///G:/Desktop/AndroidStudio/AndroidStudio_progetti/.cloud/MMA2.0/lib/models/mmc/func/settings/default_mmc_func_settings.dart';

import 'base/mmc_func.dart';

class DefaultMMCFunc extends MMCFunc{

  DefaultMMCFuncSettings settings;

  DefaultMMCFunc(this.settings);

  DefaultMMCFunc.defaultSettings() : this(DefaultMMCFuncSettings.defaultSettings());

  @override
  AssetList run(double amount) {
    _setup(amount);

    _calculateMainCardMoney();
    _calculatePersonalCardMoney();
    _calculateBusinessCardMoney();

    _evaluateResult(amount);

    return assetList;
  }

  void _setup(double amount){
    assetList.reset();

    assetList.mainCard().money = amount;
  }

  void _calculateMainCardMoney(){
    double _commission = assetList.mainCard().money / 100 * settings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * settings.percentageSheet.cashback().value();

    assetList.bonusAccount().money += _cashback;
    assetList.mainCard().money -= _commission;

    assetList.personalCard().money += assetList.mainCard().money;
    assetList.mainCard().money = _commission - _cashback;
  }

  void _calculatePersonalCardMoney(){
    double _commission = assetList.personalCard().money / 100 * settings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * settings.percentageSheet.cashback().value();

    assetList.bonusAccount().money += _cashback;
    assetList.personalCard().money -= _commission;

    double _savings = assetList.personalCard().money / 100 * settings.percentageSheet.savings().value();

    assetList.personalCard().money -= _savings;
    assetList.savingsAccount().money += _savings;

    double _business = assetList.personalCard().money / 100 * settings.percentageSheet.business().value();

    assetList.personalCard().money -= _business;
    assetList.businessCard().money += _business;

    assetList.personalCard().money += _commission - _cashback;
  }

  void _calculateBusinessCardMoney(){
    double _commission = assetList.businessCard().money / 100 * settings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * settings.percentageSheet.cashback().value();

    assetList.bonusAccount().money += _cashback;
    assetList.businessCard().money -= _commission;

    double _investments = assetList.businessCard().money / 100 * settings.percentageSheet.investments().value();

    assetList.businessCard().money -= _investments;
    assetList.investmentsAccount().money += _investments;

    assetList.speculationAccount().money += assetList.businessCard().money;
    assetList.businessCard().money = _commission - _cashback;
  }

  void _evaluateResult(double amount){
    double _leftovers = amount - assetList.assetValue();

    if(_leftovers > 0)
      assetList.bonusAccount().money += _leftovers;
    else if(_leftovers < 0)
      assetList.bonusAccount().money -= _leftovers;
  }
}