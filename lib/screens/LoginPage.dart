import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../Store/counter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static const String routeName = "login";
  final Counter counter = Counter();
  @override
  void initState() {
    super.initState();
    print('login');
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
                      child: const Text('Add Counter'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
