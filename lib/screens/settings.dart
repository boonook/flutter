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
              )
              // Container(

              // )
            ],
          ),
        ));
  }
}
