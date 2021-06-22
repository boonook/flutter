import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    this.checkPermission();
  }

  static const String routeName = "setting";
  var _image;
  final picker = ImagePicker();

  checkPermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

    ///打开应用设置：
    openAppSettings();
    ////
    // You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      "router/login", (Route<dynamic> route) => false);
                },
                child: Text("退出到登陆界面"),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("router/parents");
                },
                child: Text("前往组件交互页面"),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("router/flexbuju");
                },
                child: Text("flex布局"),
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("router/scan");
                },
                child: Text("扫一扫"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, //居中
              children: [
                Text("普通二维码"),
                SizedBox(
                  height: 20,
                ),
                QrImage(
                  data: "这是普通二维码",
                  size: 100,
                ),
                Text("中间有图片的二维码"),
                SizedBox(
                  height: 20,
                ),
                QrImage(
                  data: "这是中间有图的二维码",
                  size: 100,
                  embeddedImage: NetworkImage(""
                      "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg"),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
