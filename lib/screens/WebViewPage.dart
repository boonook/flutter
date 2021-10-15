import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:bot_toast/bot_toast.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var _controller;
  final arguments;
  _WebViewPageState({this.arguments});
  @override
  void initState() {
    super.initState();
    BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Color(0x7f000000), borderRadius: BorderRadius.circular(5)),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            Text(
              "loading...",
              style: new TextStyle(color: Color(0xffffffff)),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("webView${arguments['test']}"),
            centerTitle: true,
            leading: new IconButton(
                onPressed: () => {
                      _controller.canGoBack().then((value) {
                        if (value) {
                          _controller.goBack();
                        } else {
                          return Navigator.pop(context);
                        }
                      })
                    },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          body: WebView(
              onWebViewCreated: (WebViewController WebViewController) {
                _controller = WebViewController;
              },
              initialUrl:
                  'https://wtest.133.cn/dev/zhuxw/webapp/promotion/2021nationalday/home',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                print("加载完成$url");
                BotToast.cleanAll();
              },
              onPageStarted: (String url) {
                print("开始加载$url");
              })),
    );
  }
}
