abstract class Fund{

  //Public Variables

  String name;
  String description;
  double money;

  Fund(this.name, this.description, this.money);

  //Public Methods

  void reset() => money = 0;
}