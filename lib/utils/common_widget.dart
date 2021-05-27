import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CommonWidget {
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      fontSize: 16.0,
    );
  }

  static AppBar buildAppBar(String title) {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios),
      title: Text(title),
      centerTitle: true,
    );
  }

  static Icon buildBackIcon() => Icon(Icons.arrow_back_ios);

  static Widget buildEmptyList() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/empty.png',
            fit: BoxFit.none,
          ),
          SizedBox(height: 20),
          Text(
            'empty_hint'.tr,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  static Widget buildFirstLoad() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
