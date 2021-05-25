import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/tab/HomeTab.dart';
import 'package:wan_android_flutter/pages/main/tab/MineTab.dart';
import 'package:wan_android_flutter/pages/main/tab/ProjectTab.dart';
import 'package:wan_android_flutter/pages/main/tab/PublicTab.dart';

class MainState {
  late RxInt currentTab;

  late HomeTab _homeTab;
  late ProjectTab _projectTab;
  late PublicTab _publicTab;
  late MineTab _mineTab;
  late List<Widget> _allTabs;

  MainState() {
    currentTab = 0.obs;

    _homeTab = HomeTab();
    _projectTab = ProjectTab();
    _publicTab = PublicTab();
    _mineTab = MineTab();
    _allTabs = [_homeTab, _projectTab, _publicTab, _mineTab];
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
