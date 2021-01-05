class Percentage{

  //Public Variables

  String name;

  //Private Variables

  double _value;
  double _minValue;
  double _maxValue;

  Percentage(String name, double defaultValue, double minValue, double maxValue){
    this.name = name;
    this._value = defaultValue;
    this._minValue = minValue;
    this._maxValue = maxValue;

    _verifyMinMax();
    _clampValue();
  }

  //Public Methods

  //Setters

  void setValue(double value){
    _value = value;
    _clampValue();
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

  void _clampValue(){
    if(_value < _minValue)
      _value = _minValue;
    else if(_value > _maxValue)
      _value = _maxValue;
  }

  //Getters

  double value() => _value;
  double minValue() => _minValue;
  double maxValue() => _maxValue;
}