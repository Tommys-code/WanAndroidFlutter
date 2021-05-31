import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/coin.dart';
import 'package:wan_android_flutter/models/coin_list_data.dart';

class MyCoinLogic extends GetxController {
  late final Repository _repository = Get.find();
  var coin = Rxn<Coin>();
  var coinList = Rxn<List<CoinListData>>();

  late EasyRefreshController refreshController;

  int _currentPage = 1;
  int _totalCount = 1;

  MyCoinLogic() {
    refreshController = EasyRefreshController();
    getCoinData();
    loadList();
  }

  getCoinData() async {
    var stream = _repository.getCoins();
    stream.listen((event) {
      coin.value = event;
      coin.refresh();
    });
  }

  loadList() async {
    _currentPage = 1;
    CoinList? data = await _repository.getCoinList(_currentPage);
    _totalCount = data?.pageCount ?? 1;
    coinList.value = data?.datas;
    coinList.refresh();
  }

  loadMore() async {
    if (noMoreData()) return;
    _currentPage++;
    CoinList? data = await _repository.getCoinList(_currentPage);
    coinList.value?.addAll(data?.datas ?? RxList.empty());
    coinList.refresh();
  }

  bool noMoreData() {
    if (_currentPage == _totalCount) {
      refreshController.finishLoad(noMore: true);
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
