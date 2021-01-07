class Percentage{

  //Public Variables

  String name;

  //Private Variables

  double _defaultValue;

  double _value;
  double _minValue;
  double _maxValue;

  Percentage(String name, double defaultValue, double minValue, double maxValue){
    this.name = name;

    this._minValue = minValue;
    this._maxValue = maxValue;

    _verifyMinMax();

    this._defaultValue = defaultValue;

    _clampValue(_defaultValue);

    this._value = _defaultValue;
  }

  //Public Methods

  void resetValue() => _value = _defaultValue;

  //Setters

  void setValue(double value){
    _value = value;
    _clampValue(_value);
  }

  void setMinValue(double minValue){
    _minValue = minValue;
    _verifyMinMax();
  }
  void setMaxValue(double maxValue){
    _maxValue = maxValue;
    _verifyMinMax();
  }

  //Private Methods

  void _verifyMinMax(){
    if(_minValue > _maxValue)
      _minValue = _maxValue - 0.1;
    else if(_maxValue < _minValue)
      _maxValue = _minValue + 0.1;
  }

  void _clampValue(double value){
    if(value < _minValue)
      value = _minValue;
    else if(value > _maxValue)
      value = _maxValue;
  }

  //Getters

  double value() => _value;
  double minValue() => _minValue;
  double maxValue() => _maxValue;
}