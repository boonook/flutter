import 'package:flutter/material.dart';
import '../components/HeaderAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
          children: [
            Text("首页"),
            RaisedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Text("打开侧边栏"),
            )
          ],
        ),
      ),
    );
  }
}
