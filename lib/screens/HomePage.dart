import 'package:flutter/material.dart';
import '../components/HeaderAppBar.dart';
import '../components/HomeChild.dart';
import '../events/count_events.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String data = "无";
  String dataTwo = "传递给组件2的值";

  void onChanged(val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeaderAppBar(
          ({text}) {
            print('子组件的值是: ' + text);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("首页"),
            RaisedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Text("打开侧边栏"),
            ),
            Text('子组件2，传过来的值:' + '$data'),
            HomeChild()
          ],
        ),
      ),
    );
  }
}
