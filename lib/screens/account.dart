import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("account"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("account"),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      "router/login", (Route<dynamic> route) => false);
                },
                child: Text("退出到登陆界面"),
              ),
            ],
          ),
        ));
  }
}
