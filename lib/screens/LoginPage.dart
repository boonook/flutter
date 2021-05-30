import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../Store/counter.dart';
import 'package:my_app/Config/Contant.dart';
import 'package:my_app/Utils/http.dart';
import 'dart:convert';

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
  @override
  void initState() {
    super.initState();
    print('login');
    getHttp();
    print(Contant.apiPrefix);
  }

  void getHttp() async {
    var url = 'api/music/search?keyword=我爱你';
    dynamic data = await http.requestData(url, {}, {});
    print('123123123123123123' + json.encode(data));
  }

  LoginScreenState() {
    print('123123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
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
                            color: kYellow, width: 3, style: BorderStyle.solid),
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
            )
          ],
        ),
      ),
    );
  }
}
