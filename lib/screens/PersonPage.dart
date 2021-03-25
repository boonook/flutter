import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("点击跳转"),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("router/setting");
                },
                child: Text("设置"),
              ),
              RaisedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Text("打开侧边栏"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
