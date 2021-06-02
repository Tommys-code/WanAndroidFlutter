import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/utils/common_widget.dart';

typedef CollectCallBack = void Function(bool);

class ArticleItemWidget extends StatelessWidget {
  final ArticleData item;
  final CollectCallBack? callBack;

  late final Repository _repository = Get.find();
  late final collect = RxBool(false);

  ArticleItemWidget({
    Key? key,
    required this.item,
    this.callBack,
  }) : super(key: key) {
    collect.value = item.collect;
  }

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
        onTap: () => {Get.toNamed(RouteConfig.web, arguments: item.link)},
      ),
    );
  }

  _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildNew(),
            Text(
              item.author?.isEmpty ?? true
                  ? 'home_share_user'.trArgs([item.shareUser])
                  : 'home_author'.trArgs(
                      [item.author ?? ''],
                    ),
              style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            ),
            Expanded(child: SizedBox()),
            Text(item.niceDate,
                style: TextStyle(fontSize: 12, color: Color(0xff666666))),
          ],
        ),
        SizedBox(height: 4),
        Text(
          item.title,
          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.superChapterName.isEmpty
                  ? item.chapterName
                  : item.superChapterName + ' - ' + item.chapterName,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
            Expanded(child: SizedBox()),
            Container(
              width: 24,
              height: 24,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Obx(() => Icon(
                      collect.value ? Icons.star : Icons.star_border,
                      color: Colors.blue,
                      size: 24,
                    )),
                onPressed: () => _collect(),
              ),
            )
          ],
        )
      ],
    );
  }

  _collect() async {
    bool res = await _repository.collect(item.id, item.collect);
    if (res) {
      CommonWidget.showToast(
          item.collect ? 'un_collect_success'.tr : 'collect_success'.tr);
      item.collect = !item.collect;
      collect.value = !collect.value;
      if (callBack != null) callBack!(true);
    }
    if (callBack != null) callBack!(false);
  }

  _buildNew() {
    return Offstage(
      offstage: !item.isNew(),
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
