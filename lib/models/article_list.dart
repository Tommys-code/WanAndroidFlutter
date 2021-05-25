class ArticleList {
  late List<ArticleData> datas;
  late int pageCount;

  ArticleList({required this.datas, required this.pageCount});

  ArticleList.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = <ArticleData>[];
      json['datas'].forEach((v) {
        datas.add(new ArticleData.fromJson(v));
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

class ArticleData {
  late int id;
  late String author;
  late String shareUser;
  late String niceDate;
  late String title;
  late int publishTime;
  late String link;
  late String superChapterName;
  late String chapterName;
  late bool collect;

  bool isNew() {
    return publishTime >=
        (DateTime.now().millisecondsSinceEpoch - 24 * 60 * 60 * 1000);
  }

  ArticleData({
    required this.id,
    required this.author,
    required this.shareUser,
    required this.niceDate,
    required this.title,
    required this.publishTime,
    required this.link,
    required this.superChapterName,
    required this.chapterName,
    required this.collect,
  });

  ArticleData.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    publishTime = json['publishTime'];
    shareUser = json['shareUser'];
    superChapterName = json['superChapterName'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['chapterName'] = this.chapterName;
    data['collect'] = this.collect;
    data['id'] = this.id;
    data['link'] = this.link;
    data['niceDate'] = this.niceDate;
    data['publishTime'] = this.publishTime;
    data['shareUser'] = this.shareUser;
    data['superChapterName'] = this.superChapterName;
    data['title'] = this.title;
    return data;
  }
}
