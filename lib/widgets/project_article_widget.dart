import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/routes/route.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';

class ProjectArticleWidget extends StatelessWidget {
  final ArticleData data;

  late final Repository _repository = Get.find();
  late final RxBool collect;

  ProjectArticleWidget({Key? key, required this.data}) : super(key: key) {
    collect = RxBool(data.collect);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _buildContent(),
      onTap: () => Get.toNamed(RouteConfig.web, arguments: data.link),
    ).paddingAll(10);
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: data.envelopePic,
            width: 80,
            height: 100,
            fit: BoxFit.cover,
          ),
        ).marginOnly(right: 10),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                  ),
                ).marginOnly(top: 3),
                Expanded(child: SizedBox()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.author ?? '',
                      style: TextStyle(
                        color: Color(0xff666666),
                      ),
                    ).drawableHorizontal(
                        left: Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 18,
                    ).marginOnly(right: 3)),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 24,
                      height: 24,
                      child: _buildCollect(),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCollect() {
    return IconButton(
      padding: EdgeInsets.all(0),
      icon: Obx(() => Icon(
            collect.value ? Icons.star : Icons.star_border,
            color: Colors.blue,
            size: 24,
          )),
      onPressed: () => _collect(),
    );
  }

  _collect() async {
    bool res = await _repository.collect(data.id, data.collect);
    if (res) {
      data.collect = !data.collect;
      collect.value = !collect.value;
    }
  }
}
