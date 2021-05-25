import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/main/main_logic.dart';

class PublicTab extends GetView<MainLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('square'.tr)),
      body: Center(child: Text('square'),),
    );
  }
}
