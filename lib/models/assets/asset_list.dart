import 'card.dart';
import 'account.dart';

class AssetList{

  //Private Variables

  Card _mainCard;
  Card _personalCard;
  Card _businessCard;

  Account _investmentsAccount;
  Account _speculationAccount;
  Account _savingsAccount;
  Account _bonusAccount;

  AssetList(){
    _mainCard = new Card("Main Card");
    _personalCard = new Card("Personal Card");
    _businessCard = new Card("Business Card");

    _investmentsAccount = new Account("Investments Account");
    _speculationAccount = new Account("Speculation Account");
    _savingsAccount = new Account("Savings Account");
    _bonusAccount = new Account("Bonus Account");
  }

  //Public Methods

  //Getters

  double physicalAssetValue() => _mainCard.money + _personalCard.money + _businessCard.money;
  double virtualAssetValue() => _investmentsAccount.money + _speculationAccount.money + _savingsAccount.money + _bonusAccount.money;

  double assetValue() => physicalAssetValue() + virtualAssetValue();

  Card mainCard() => _mainCard;
  Card personalCard() => _personalCard;
  Card businessCard() => _businessCard;

  Account investmentsAccount() => _investmentsAccount;
  Account speculationAccount() => _speculationAccount;
  Account savingsAccount() => _savingsAccount;
  Account bonusAccount() => _bonusAccount;
}