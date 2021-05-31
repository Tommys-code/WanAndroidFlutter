import 'package:date_format/date_format.dart';

class CoinList {
  late List<CoinListData> datas;
  late int pageCount;

  CoinList({required this.datas, required this.pageCount});

  CoinList.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <CoinListData>[];
      json['datas'].forEach((v) {
        datas.add(new CoinListData.fromJson(v));
      });
    }
    pageCount = json['pageCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
    data['pageCount'] = this.pageCount;
    return data;
  }
}

class CoinListData {
  late int coinCount;
  late int date;
  late String desc;
  late int id;
  late String reason;
  late int type;
  late int userId;
  late String userName;

  String getDate() {
    return formatDate(DateTime.fromMicrosecondsSinceEpoch(date),
        [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
  }

  CoinListData(
      {required this.coinCount,
      required this.date,
      required this.desc,
      required this.id,
      required this.reason,
      required this.type,
      required this.userId,
      required this.userName});

  CoinListData.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    date = json['date'];
    desc = json['desc'];
    id = json['id'];
    reason = json['reason'];
    type = json['type'];
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinCount'] = this.coinCount;
    data['date'] = this.date;
    data['desc'] = this.desc;
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}
