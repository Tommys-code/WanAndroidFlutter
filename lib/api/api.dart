class Api {
  ///首页banner
  static const String HOME_BANNER = "banner/json";

  ///首页文章列表
  static const String HOME_ARTICLE_LIST = "article/list/{pageNum}/json";

  ///搜索热词
  static const String HOME_HOT_KEY = "hotkey/json";

  ///关键字查询文章
  static const String QUERY_ARTICLES = "article/query/{pageNum}/json";

  ///获取公众号列表
  static const String PUBLIC_CHAPTER = "wxarticle/chapters/json";

  ///获取公众号列表
  static const String PUBLIC_CHAPTER_ARTICLES =
      "wxarticle/list/{id}/{pageNum}/json";
}
