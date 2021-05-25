import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/routes/route.dart';

class ArticleItemWidget extends StatefulWidget {
  final ArticleData item;

  ArticleItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1.0, 5.0), //阴影xy轴偏移量
            blurRadius: 3.0, //阴影模糊程度
            spreadRadius: 0.5, //阴影扩散程度
          ),
        ],
      ),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          child: _buildContent(),
        ),
        onTap: () => {Get.toNamed(RouteConfig.web, arguments: getData().link)},
      ),
    );
  }

  ArticleData getData() {
    return widget.item;
  }

  _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildNew(),
            Text(
              getData().author.isEmpty
                  ? 'home_share_user'.trArgs([getData().shareUser])
                  : 'home_author'.trArgs(
                      [getData().author],
                    ),
              style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            ),
            Expanded(child: SizedBox()),
            Text(getData().niceDate,
                style: TextStyle(fontSize: 12, color: Color(0xff666666))),
          ],
        ),
        SizedBox(height: 4),
        Text(
          widget.item.title,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              getData().superChapterName + ' - ' + getData().chapterName,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: 24,
              height: 24,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  getData().collect ? Icons.star : Icons.star_border,
                  color: Colors.blue,
                  size: 24,
                ),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }

  _buildNew() {
    return Offstage(
      offstage: !widget.item.isNew(),
      child: Container(
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(2))),
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          'new'.tr,
          style: TextStyle(color: Colors.blue, fontSize: 12),
        ),
      ),
    );
  }
}
