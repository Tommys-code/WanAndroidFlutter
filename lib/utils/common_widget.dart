import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
}