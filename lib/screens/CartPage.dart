import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: Container(
            child: Center(
          child: Text("购物车"),
        )),
      ),
    );
  }
}
