import 'percentage.dart';

class PercentageSheet{

  //Private Variables

  Percentage _commission;
  Percentage _cashback;
  Percentage _savings;
  Percentage _business;
  Percentage _investments;

  PercentageSheet(this._commission, this._cashback, this._savings, this._business, this._investments);

  //Public Methods

  //Getters

  Percentage commission() => _commission;
  Percentage cashback() => _cashback;
  Percentage savings() => _savings;
  Percentage business() => _business;
  Percentage investments() => _investments;
}