import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
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
      body: ListView(children: <Widget>[
        Container(
          height: 180,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    color: Colors.green,
                    child: Text(
                      '主题1——1',
                      style: new TextStyle(fontSize: 18.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity),
                flex: 1,
              ),
              Expanded(
                child: Text('主题1——2'),
                flex: 1,
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
