import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/article_list.dart';
import 'package:wan_android_flutter/pages/main/state/project_list_logic.dart';
import 'package:wan_android_flutter/utils/widget_extensions.dart';
import 'package:wan_android_flutter/widgets/article_Item_widget.dart';

class ProjectListTab extends StatefulWidget {
  final int id;

  ProjectListTab({required this.id});

  @override
  State<StatefulWidget> createState() => _ProjectListTabState();
}

class _ProjectListTabState extends State<ProjectListTab>
    with AutomaticKeepAliveClientMixin {

  late final ProjectListState state;

  @override
  Widget build(BuildContext context) {
    state = ProjectListState(id: widget.id);
    super.build(context);
    return _buildRefresh();
  }

  Widget _buildRefresh() {
    return Obx(
      () => EasyRefresh(
        child: _buildListView(),
        onRefresh: () => state.loadData(),
        onLoad: () => state.loadMore(),
      ).buildListStateWidget(value: state.articles.value),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        ArticleData data = state.articles.value![index];
        return ArticleItemWidget(item: data);
      },
      itemCount: state.articles.value?.length ?? 0,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
