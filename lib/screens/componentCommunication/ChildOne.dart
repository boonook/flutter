import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildOne extends StatefulWidget {
  final callBack;
  final data;
  String parentData = '00';
  ChildOne({key, this.data, this.callBack}) : super(key: key);
  void onChildOneChanged(val) {
    this.parentData = val;
  }

  ChildOneState createState() => ChildOneState();
}

class ChildOneState extends State<ChildOne> {
  @override
  Widget build(BuildContext context) {
    //横向布局
    return Column(
      children: <Widget>[
        Container(
          child: Text('子组件:' + widget.data),
        ),
        Container(
          child: Text('---------------------------------------'),
        ),
        Container(
          child: Text('子组件向父组件传值'),
        ),
        Container(
          child: TextButton(
            child: Text('子组件向父组件传值:ChildOne',style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () {
              widget.callBack('ChildOne');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(30)),
              backgroundColor:MaterialStateProperty.all(Colors.orange),
            ),
          ),
        ),
        Container(
          child: Text('---------------------------------------'),
        ),
        Container(
          child: Text('父组件通过事件传递过来的值：' + widget.parentData),
        ),
      ],
    );
  }
}
