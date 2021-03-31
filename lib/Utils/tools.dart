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
  static void showToast(msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static _printMap() {
    print(Contant.getGroupPage);
  }
}