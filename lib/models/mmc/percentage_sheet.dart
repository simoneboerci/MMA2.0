import 'percentage.dart';

class PercentageSheet{

  //Private Variables

  Percentage _commission;
  Percentage _cashback;
  Percentage _savings;
  Percentage _business;
  Percentage _investments;

  PercentageSheet(this._commission, this._cashback, this._savings, this._business, this._investments);

  PercentageSheet.defaultSettings() : this(
    Percentage("Commission", 6, 5, 15),
    Percentage("Cashback", 50, 20, 50),
    Percentage("Savings", 20, 20, 60),
    Percentage("Business", 70, 20, 70),
    Percentage("Investments", 74, 50, 90)
  );

  //Public Methods

  void resetValues(){
    _commission.resetValue();
    _cashback.resetValue();
    _savings.resetValue();
    _business.resetValue();
    _investments.resetValue();
  }

  //Getters

  Percentage commission() => _commission;
  Percentage cashback() => _cashback;
  Percentage savings() => _savings;
  Percentage business() => _business;
  Percentage investments() => _investments;
}