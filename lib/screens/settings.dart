import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/Utils/AppUtil.dart';

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
    String url =
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg";
    AppUtil.saveImage(url);
  }

  GlobalKey _globalKey = new GlobalKey();
  static const String routeName = "setting";
  var _image;
  final picker = ImagePicker();

  checkPermission() async {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      print('您当前没有开启相册权限');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('温馨提示！'),
              content: Text('您当前没有开启相册权限，是否前往开启？'),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    '取消',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
                FlatButton(
                  child: Text('确认'),
                  onPressed: () {
                    openAppSettings();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            );
          });
      return;
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

  Future saveQrImage() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    var status = await Permission.storage.status;
    print(status);
    if (status.isDenied) {
      openAppSettings(); // 没有权限打开设置页面
    } else {
      capturePng(); // 已有权限开始保存
    }
  }

  Future capturePng() async {
    try {
      print('开始保存');
      final boundary = _globalKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      var byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var result =
          await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
      print(result); // result是图片地址
      BotToast.showSimpleNotification(title: '保存成功');
    } catch (e) {
      print(e);
    }
    return null;
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
                RepaintBoundary(
                  key: _globalKey,
                  child: QrImage(
                    data: "这是中间有图的二维码",
                    size: 100,
                    embeddedImage: NetworkImage(""
                        "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg"),
                  ),
                ),
                //随便写个按钮什么的截图
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "保存二维码",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //截图保存图片方法
                    saveQrImage();
                  },
                )
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
