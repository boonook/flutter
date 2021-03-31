import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  initState() {
    print('login');

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
            Text("点击跳转"),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("router/home");
              },
              child: Text("跳转"),
            )
          ],
        ),
      ),
    );
  }
}
