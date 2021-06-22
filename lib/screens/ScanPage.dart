import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class ScanPage extends StatefulWidget {
  const ScanPage();
  @override
  ScanPageState createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  static const String routeName = "setting";
  var textStr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("扫一扫"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width, //充满屏幕宽度,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //居中
            children: [
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                child: Text("二维码扫描"),
                onPressed: () {
                  getQrcodeState().then((value) => setState(() {
                        this.textStr = value;
                      }));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("扫描内容为${this.textStr}"),
            ],
          ),
        ));
  }

  //扫描二维码
  static Future<String> getQrcodeState() async {
    try {
      const ScanOptions options = ScanOptions(
        strings: {
          'cancel': '取消',
          'flash_on': '开启闪光灯',
          'flash_off': '关闭闪光灯',
        },
      );
      final ScanResult result = await BarcodeScanner.scan(options: options);
      return result.rawContent;
    } catch (e) {}
    return '';
  }
}
