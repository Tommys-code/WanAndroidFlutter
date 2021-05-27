import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/pages/main/state/project_state.dart';
import 'package:wan_android_flutter/pages/main/tab/project_list_tab.dart';

class ProjectTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
        length: controller.projectState.projectTree.value?.length??0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('project'.tr),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: _buildTabs(),
            ),
          ),
          body: TabBarView(
            children: _buildTabViews(),
          ),
        )));
  }

  List<Widget> _buildTabs() {
    return controller.projectState.projectTree.value
            ?.map((e) => Tab(text: e.name))
            .toList() ??
        [];
  }

  List<Widget> _buildTabViews() {
    return controller.projectState.projectTree.value
            ?.map((e) => ProjectListTab(id: e.id))
            .toList() ??
        [];
  }
}
