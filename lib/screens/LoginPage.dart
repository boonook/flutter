import 'package:flutter/material.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_app/Store/counter.dart';
import 'package:my_app/Config/Contant.dart';
import 'package:my_app/Utils/http.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/components/basic.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static const String routeName = "login";
  dynamic phone = '';
  static const kYellow = const Color(0xFF444444);
  static const kRed = const Color(0xFFd32F2F);
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _passwordEditingController =
      new TextEditingController();
  final Counter counter = Counter();
  var songs = [];
  final List formList = [
    {"title": '123123123'},
    {"title": '123123123'},
    {"title": '123123123'}
  ];
  List dataList = [];
  @override
  void initState() {
    super.initState();
    print('login');
    print(Contant.apiPrefix);
    this.getHttp().then((value) {
      setState(() {
        dataList = value;
      });
    });
  }

  Future getHttp() async {
    try {
      var url = 'api/music/search?keyword=我爱你';
      dynamic data = await http.requestData(url, {}, {});
      return data['songs'];
    } catch (e) {
      return print(e);
    }
  }

  Widget buildGrade() {
    List<Widget> titles = [];
    Widget content;
    // dataList.forEach((element) {
    //   titles.add(new Row(
    //     children: <Widget>[new Text(element['name'])],
    //   ));
    // });
    content = new Column(
      children: titles,
    );
    return content;
  }

  getToken() {
    print(counter.userToken);
  }

  void _changeLanguage() async {
    print('修改前语言环境:${Intl.getCurrentLocale()}');
    await S.load(Locale('zh'));
    //setState刷新页面改变语言
    setState(() {});
    print('修改后语言环境:${Intl.getCurrentLocale()}');
  }

  void _changeEngLanguage() async {
    print('修改前语言环境:${Intl.getCurrentLocale()}');
    await S.load(Locale('en'));
    //setState刷新页面改变语言
    setState(() {});
    print('修改后语言环境:${Intl.getCurrentLocale()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登陆" + S.of(context).home),
          brightness: Brightness.dark,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("点击跳转"),
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("router/home");
                  // print(phone);
                },
                child: Text("跳转"),
              ),
              new RaisedButton(
                onPressed: () {
                  getToken();
                  // print(phone);
                },
                child: Text("重新加载"),
              ),
              new RaisedButton(
                onPressed: () {
                  SystemChrome.setEnabledSystemUIOverlays([]);
                },
                child: Text("隐藏状态栏"),
              ),
              new RaisedButton(
                onPressed: () {
                  SystemChrome.setEnabledSystemUIOverlays(
                      [SystemUiOverlay.top]);
                },
                child: Text("显示状态栏"),
              ),
              new RaisedButton(
                onPressed: () {
                  _changeLanguage();
                  // print(phone);
                },
                child: Text("中文"),
              ),
              new RaisedButton(
                onPressed: () {
                  _changeEngLanguage();
                  // print(phone);
                },
                child: Text("英文"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed("router/FlutterEasyrefresh");
                },
                child: Text("下拉刷新上拉加载"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BasicExample();
                  }));
                },
                child: Text("下拉刷新上拉加载22222"),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    const Text('状态管理器'),
                    Observer(
                      builder: (_) => Text(
                        '${counter.value}',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: counter.increment,
                        child: const Text('Add Counter')),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    new TextField(
                      controller: _controller,
                      style: TextStyle(fontSize: 16, color: kYellow),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      cursorColor: kYellow,
                      decoration: new InputDecoration(
                        hintText: '请输入手机号',
                        labelText: "手机号",
                        labelStyle: TextStyle(color: kYellow),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: kYellow,
                              width: 3,
                              style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: kRed, width: 1, style: BorderStyle.solid),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                        print(value);
                      },
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
              ),
              Container(
                child: Column(children: <Widget>[
                  new TextField(
                    controller: _passwordEditingController,
                    style: TextStyle(fontSize: 16, color: kYellow),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: new InputDecoration(
                      hintText: '请输入密码',
                      labelText: "密码",
                      labelStyle: TextStyle(color: kYellow),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: kYellow, width: 3, style: BorderStyle.solid),
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ]),
                margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
              ),
              Container(
                child: buildGrade(),
              )
            ],
          ),
        ));
  }
}
