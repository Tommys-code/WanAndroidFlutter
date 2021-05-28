import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';
import 'package:wan_android_flutter/pages/main/tab/project_list_tab.dart';
import 'package:wan_android_flutter/widgets/keep_alive_page.dart';

class ProjectTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
        length: controller.projectState.projectTree.value?.length ?? 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('project'.tr),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Material(
                child: TabBar(
                  unselectedLabelColor: Colors.blue[600],
                  labelColor: Colors.blue[700],
                  isScrollable: true,
                  tabs: _buildTabs(),
                ),
              ),
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
            ?.map((e) => KeepAlivePage(ProjectListTab(id: e.id)))
            .toList() ??
        [];
  }
}
