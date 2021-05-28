import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/pages/main/state/project_list_logic.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';
import 'package:wan_android_flutter/widgets/project_article_widget.dart';

class ProjectListTab extends StatelessWidget {
  late final ProjectListLogic _logic;

  final int id;

  ProjectListTab({required this.id});

  @override
  Widget build(BuildContext context) {
    _logic = Get.put(ProjectListLogic(id: id), tag: "$id");
    return _buildRefresh();
  }

  Widget _buildRefresh() {
    return Obx(
      () => EasyRefresh(
        child: _buildListView(),
        onRefresh: () => _logic.loadData(),
        onLoad: () => _logic.loadMore(),
      ).buildListStateWidget(value: _logic.articles.value),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        ArticleData data = _logic.articles.value![index];
        return ProjectArticleWidget(item: data);
      },
      itemCount: _logic.articles.value?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey[400],
          height: 2,
          indent: 10,
          endIndent: 10,
        );
      },
    );
  }
}
