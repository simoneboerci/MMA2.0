import 'package:mmc/models/assets/asset_list.dart';

abstract class MMCFunc<T extends MMCFunc<T>>{

  static var instance;

  MMCFunc(){
    if(instance == null)
      instance = T as T;
  }

  AssetList run(double amount);
}