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

  ///项目分类
  static const String PROJECT_TREE = "project/tree/json";

  ///项目列表数据
  static const String PROJECT_LIST = "project/list/{pageNum}/json";

  ///登录注册
  static const String LOGIN = "user/login";
  static const String REGISTER = "user/register";

  static const String MY_COIN = "lg/coin/userinfo/json";
  static const String MY_COIN_LIST = "lg/coin/list/{pageNum}/json";

  ///我的收藏
  static const String MY_COLLECT_LIST = "lg/collect/list/{pageNum}/json";

  ///收藏
  static const String COLLECT = "lg/collect/{id}/json";
  static const String UN_COLLECT = "lg/uncollect_originId/{id}/json";
}
