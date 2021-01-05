import 'fund.dart';

class Account extends Fund{

  Account(String name, {String description = "", double money = 0}) : super(name, description, money);
}