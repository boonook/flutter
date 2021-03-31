import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../Config/Contant.dart';

class tools {
  static init(params) {
    print(Contant.apiPrefix);
  }

  static json() {
    print(Contant.getGroupPage);
  }

  // 显示 Toast
  static void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: -1,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static _printMap() {
    print(Contant.getGroupPage);
  }
}
