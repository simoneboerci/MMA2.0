import '../assets/asset_list.dart';

import '../mmc/mmc_settings.dart';

class MoneyManagementCalculator{

  //Public Variables

  static MoneyManagementCalculator instance;

  MMCSettings mmcSettings;

  //Private Variables

  double _amount;
  AssetList _assetList;

  MoneyManagementCalculator(this.mmcSettings){
    if(instance == null)
      instance = this;
  }

  MoneyManagementCalculator.defaultSettings() : this(MMCSettings.defaultSettings());

  //Public Methods

  AssetList run(double amount){
    _amount = amount;

    _setup();

    _calculateMainCardMoney();
    _calculatePersonalCardMoney();
    _calculateBusinessCardMoney();

    _evaluateResult();

    return _assetList;
  }

  //Private Methods
  void _setup(){
    _assetList = AssetList();

    _assetList.mainCard().money = _amount;
  }

  void _calculateMainCardMoney(){
    double _commission = _assetList.mainCard().money / 100 * mmcSettings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * mmcSettings.percentageSheet.cashback().value();

    _assetList.bonusAccount().money += _cashback;
    _assetList.mainCard().money -= _commission;

    _assetList.personalCard().money += _assetList.mainCard().money;
    _assetList.mainCard().money = _commission - _cashback;
  }

  void _calculatePersonalCardMoney(){
    double _commission = _assetList.personalCard().money / 100 * mmcSettings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * mmcSettings.percentageSheet.cashback().value();

    _assetList.bonusAccount().money += _cashback;
    _assetList.personalCard().money -= _commission;

    double _savings = _assetList.personalCard().money / 100 * mmcSettings.percentageSheet.savings().value();

    _assetList.personalCard().money -= _savings;
    _assetList.savingsAccount().money += _savings;

    double _business = _assetList.personalCard().money / 100 * mmcSettings.percentageSheet.business().value();

    _assetList.personalCard().money -= _business;
    _assetList.businessCard().money += _business;

    _assetList.personalCard().money += _commission - _cashback;
  }

  void _calculateBusinessCardMoney(){
    double _commission = _assetList.businessCard().money / 100 * mmcSettings.percentageSheet.commission().value();
    double _cashback = _commission / 100 * mmcSettings.percentageSheet.cashback().value();

    _assetList.bonusAccount().money += _cashback;
    _assetList.businessCard().money -= _commission;

    double _investments = _assetList.businessCard().money / 100 * mmcSettings.percentageSheet.investments().value();

    _assetList.businessCard().money -= _investments;
    _assetList.investmentsAccount().money += _investments;

    _assetList.speculationAccount().money += _assetList.businessCard().money;
    _assetList.businessCard().money = _commission - _cashback;
  }

  void _evaluateResult(){
    double _leftovers = _amount - _assetList.assetValue();

    if(_leftovers > 0)
      _assetList.bonusAccount().money += _leftovers;
    else if(_leftovers < 0)
      _assetList.bonusAccount().money -= _leftovers;
  }
}