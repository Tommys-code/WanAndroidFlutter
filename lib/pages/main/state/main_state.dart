import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/tab/home_tab.dart';
import 'package:wan_android_flutter/pages/main/tab/mine_tab.dart';
import 'package:wan_android_flutter/pages/main/tab/project_tab.dart';
import 'package:wan_android_flutter/pages/main/tab/public_tab.dart';

class MainState {
  late RxInt currentTab;

  late HomeTab _homeTab = HomeTab();
  late ProjectTab _projectTab = ProjectTab();
  late PublicTab _publicTab = PublicTab();
  late MineTab _mineTab = MineTab();
  late List<Widget> _allTabs = [_homeTab, _projectTab, _publicTab, _mineTab];

  MainState() {
    currentTab = 0.obs;
  }

  void switchTab(index) {
    if (index != currentTab.value) {
      currentTab.value = index;
    }
  }

  List<Widget> geTabs() {
    return _allTabs;
  }
}
