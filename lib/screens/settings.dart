import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("设置界面"),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "router/login", (Route<dynamic> route) => false);
              },
              child: Text("退出到登陆界面"),
            ),
          ],
        ),
      ),
    );
  }
}
