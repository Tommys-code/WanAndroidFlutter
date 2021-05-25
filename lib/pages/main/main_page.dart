import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';

class MainPage extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: _buildMain(),
      onWillPop: () async => _onWillPop(context),
    );
  }

  Widget _buildMain() {
    return Scaffold(
      body: Obx(() => _buildContent()),
      bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
    );
  }

  Widget _buildContent() {
    return IndexedStack(
      index: controller.mainState.currentTab.value,
      children: controller.mainState.geTabs(),
    );
  }

  //底部导航栏
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        _buildNavigationBarItem('home'.tr, Icon(Icons.home)),
        _buildNavigationBarItem('project'.tr, Icon(Icons.folder)),
        _buildNavigationBarItem('square'.tr, Icon(Icons.widgets)),
        _buildNavigationBarItem('mine'.tr, Icon(Icons.person)),
      ],
      currentIndex: controller.mainState.currentTab.value,
      onTap: (index) => controller.mainState.switchTab(index),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
    );
  }

  //导航单个Item
  BottomNavigationBarItem _buildNavigationBarItem(String label, Widget icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => new AlertDialog(
            content: new Text('exit_app'.tr),
            actions: <Widget>[
              TextButton(
                onPressed: () => Get.back(result: true),
                child: new Text('confirm'.tr),
              ),
            ],
          ),
        ) ??
        false;
  }
}
