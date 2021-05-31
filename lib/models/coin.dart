import 'package:get/get.dart';

class Coin {
  late int coinCount;
  late int level;
  late String rank;

  String getMyCoinCount() => 'my_current_score'.trArgs(['$coinCount']);

  Coin({required this.coinCount, required this.level, required this.rank});

  Coin.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    level = json['level'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinCount'] = this.coinCount;
    data['level'] = this.level;
    data['rank'] = this.rank;
    return data;
  }
}
