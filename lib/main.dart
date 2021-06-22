import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'IndexPage.dart';
import 'package:my_app/screens/account.dart';
import 'package:my_app/screens/settings.dart';
import 'package:my_app/screens/LoginPage.dart';
import './screens/componentCommunication/Parents.dart';
import 'package:my_app/screens/Flexbuju.dart';
import 'package:my_app/screens/ScanPage.dart';

void main() {
  //设置安卓状态栏透明
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  //     statusBarColor: Color(0x00000000), //设置为透明
  //   );
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
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
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        "router/home": (_) => IndexPage(),
        "router/login": (_) => LoginScreen(),
        "router/account": (_) => AccountScreen(),
        "router/setting": (_) => SettingsScreen(),
        "router/parents": (_) => Parents(),
        "router/flexbuju": (_) => Flexbuju(),
        "router/scan": (_) => ScanPage(),
      },
    );
  }
}
