class CollectList {
  late List<CollectArticleData> datas;
  late int pageCount;

  CollectList({required this.datas, required this.pageCount});

  CollectList.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <CollectArticleData>[];
      json['datas'].forEach((v) {
        datas.add(new CollectArticleData.fromJson(v));
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

class CollectArticleData {
  late int id;
  late int originId;
  late String author;
  late String niceDate;
  late String title;
  late String link;
  late String chapterName;

  CollectArticleData({
    required this.id,
    required this.author,
    required this.originId,
    required this.niceDate,
    required this.title,
    required this.link,
    required this.chapterName,
  });

  CollectArticleData.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    chapterName = json['chapterName'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['chapterName'] = this.chapterName;
    data['id'] = this.id;
    data['link'] = this.link;
    data['niceDate'] = this.niceDate;
    data['title'] = this.title;
    return data;
  }
}
