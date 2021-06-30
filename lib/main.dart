import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'IndexPage.dart';
import 'package:my_app/screens/account.dart';
import 'package:my_app/screens/settings.dart';
import 'package:my_app/screens/LoginPage.dart';
import './screens/componentCommunication/Parents.dart';
import 'package:my_app/screens/Flexbuju.dart';
import 'package:my_app/screens/ScanPage.dart';
import 'package:my_app/screens/ListCeHuaDel.dart';
import 'package:my_app/screens/DatePickerPage.dart';
import 'package:my_app/generated/l10n.dart';

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
      debugShowCheckedModeBanner: false,

      ///关闭模拟器右上角的debug图标
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      //我们只支持美国英语和中文简体
      supportedLocales: [
        const Locale('zh', ''),
        ...S.delegate.supportedLocales
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        print('当前系统语言环境$locales');
        return;
      },
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
        "router/cehua": (_) => ListCeHuaDel(),
        "router/datePicker": (_) => DatePickerPage(),
      },
    );
  }
}
