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
        child:Column(
          children: <Widget>[
            Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: Text('主体内容1-1'), flex: 1,
                  ),
                  Expanded(
                    child: Text('主体内容1-2'), flex: 1,
                  )
                ]
              )
            ),
            Expanded(
              child:Column(
                children: <Widget>[
                  Expanded(
                    child: Text('主体内容2-1'), flex: 1,
                  ),
                  Expanded(
                    child: Text('主体内容2-2'), flex: 1,
                  )
                ]
              )
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
