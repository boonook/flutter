import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
import 'package:my_app/screens/FlutterEasyrefresh.dart';

void main() {
  //设置安卓状态栏透明
  // if (Platform.isAndroid) {
  //   SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  //     statusBarColor: Color(0x00000000), //设置为透明
  //   );
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // }
  // SystemChrome.setSystemUIOverlayStyle([SystemUiOverlay.top]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: MaterialApp(
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
          locale: const Locale('zh'), ////设置语言类型
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
            "router/FlutterEasyrefresh": (_) => FlutterEasyrefresh(),
          },
        ));
  }
}
