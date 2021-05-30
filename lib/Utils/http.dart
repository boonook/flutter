import 'package:dio/dio.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

///http请求
class http {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map<String, String> optionParams = {
    "mirrorToken": '',
    "content-Type": CONTENT_TYPE_JSON
  };
  static String baseUrl = "https://v1.alapi.cn/";

  ///发起网络请求
  ///[ url] 请求url
  ///[ param] 请求参数
  ///[ header] 外加头
  ///[ isNeedToken] 是否需要token
  ///[ optionMetod] 请求类型 post、get
  ///[ noTip] 是否需要返回错误信息 默认不需要
  ///[ needSign] 是否需要Sign校验  默认需要
  ///[ needError] 是否需要错误提示
  static requestData(url, param, Map<String, String> header,
      {bool isNeedToken = true,
      String optionMetod = "post",
      noTip = false,
      needSign = true,
      needError = true}) async {
    ///初始化请求类
    Dio dio = new Dio();
    print(url);
    BotToast.showAttachedWidget(
        attachedBuilder: (_) => Card(
              color: Color(0x8c000000), // 背景色
              child: Container(
                width: 120,
                height: 120,
                alignment: Alignment.center,
                child: Center(
                    child: Column(children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  Container(
                    child: Text("loading...",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                ])),
              ),
            ),
        duration: Duration(seconds: 20),
        target: Offset(520, 520));

    ///头部
    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }
    //请求协议 post 、get
    Options option = new Options(method: optionMetod);

    ///设置头部
    if (option != null) {
      option.headers = headers;
    }
    option.sendTimeout = 15000;
    //获取token
    var params = param;
    dynamic response = {};
    try {
      ///开始请求
      response =
          await dio.request("$baseUrl$url", data: params, options: option);
    } on DioError catch (e) {
      if (e.response != null) {
      } else {}
      if (needError) {
        return e;
      }
    }
    try {
      var responseJson = response.data;
      // Fluttertoast.cancel();
      if (responseJson['code'] == 200) {
        ///请求链接成功
        return responseJson['data'];
      }
    } catch (e) {
      throw e;
    }
  }
}
