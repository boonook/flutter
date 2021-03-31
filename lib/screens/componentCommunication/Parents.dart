import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './ChildOne.dart';
import '../../Utils/tools.dart';

class Parents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentsState();
  }
}

class ParentsState extends State<Parents> {
  String data = "父组件传递给子组件的值";
  String ChildOneData = "";
  void onChanged(val) {
    setState(() {
      ChildOneData = val;
    });
  }

  @override
  void initState() {
    tools.json();
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
    print('--------------------------------------默认触发函数0000------------------------------------------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件交互',
            style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black87, //设置appBar的icon颜色
        ),
        textTheme: TextTheme(
            title: TextStyle(
          //设置appBar的文本样式
          color: Colors.black87,
        )),
      ),
      body: ListView(children: <Widget>[
        Container(
          height: 100,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Text('主题1——2'),
                flex: 1,
              )
            ],
          ),
        ),
        Container(
          child:
              new ChildOne(data: data, callBack: (value) => onChanged(value)),
        ),
        Container(
          child: Text('------------------------------------------'),
        ),
        Container(
          child: Text('子组件传递过来的值--：' + ChildOneData),
        ),
        Container(
          child: Text('------------------------------------------'),
        ),
        Container(
            child: Column(children: <Widget>[
          RaisedButton(
            child: Text('父组件触发子组件中的事件'),
            onPressed: () {
              ChildOne().onChildOneChanged('123456');
            },
            textColor: Colors.white,
            color: Colors.blue[200],
          ),
        ])),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
