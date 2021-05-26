import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/pages/search/search_logic.dart';

class SearchResultPage extends StatelessWidget {
  late final String _key = Get.arguments;
  final SearchLogic _control = Get.find();

  @override
  Widget build(BuildContext context) {
    printInfo(info: _key);
    return Scaffold(
      appBar: AppBar(
        titleSpacing :0,
        automaticallyImplyLeading: false,
        title: _buildSearchBar(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Text(_key),
          ).marginOnly(left: 14),
        ),
        TextButton(
            onPressed: () => {},
            child: Text(
              'cancel'.tr,
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
