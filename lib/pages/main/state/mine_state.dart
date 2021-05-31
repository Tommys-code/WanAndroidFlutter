import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/coin.dart';

class MineState {
  late final Repository _repository;
  var coin = Rxn<Coin>();

  MineState() {
    _repository = Get.find();
  }

  getCoinData() async {
    var stream = _repository.getCoins();
    stream.listen((event) {
      coin.value = event;
      coin.refresh();
    });
  }

  clearCoinData(){
    coin.value = null;
    coin.refresh();
  }
}
