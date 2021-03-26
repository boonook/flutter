import 'package:flutter/material.dart';
import 'IndexPage.dart';
import 'package:my_app/screens/account.dart';
import 'package:my_app/screens/settings.dart';
import 'package:my_app/screens/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '航班管家',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        "router/home": (_) => IndexPage(),
        "router/login": (_) => LoginScreen(),
        // "router/account": (_) => AccountScreen(),
        "router/setting": (_) => SettingsScreen(),
      },
    );
  }
}
