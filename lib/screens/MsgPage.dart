import 'package:flutter/material.dart';

class MsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('消息中心'),
        ),
        body: Container(
            child: Center(
          child: Text("消息中心"),
        )),
      ),
    );
  }
}
