import 'package:mmc/models/assets/asset_list.dart';

abstract class MMCFunc{

  AssetList assetList = AssetList();

  AssetList run(double amount);
}