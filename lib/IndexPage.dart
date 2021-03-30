import 'package:flutter/material.dart';
import 'screens/CartPage.dart';
import 'screens/HomePage.dart';
import 'screens/MsgPage.dart';
import 'screens/PersonPage.dart';
import 'screens/PersonPage.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

int currentIndex = 0;
final pages = [HomePage(), MsgPage(), CartPage(), PersonPage()];
final List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home), backgroundColor: Colors.blue, title: Text('首页')),
  BottomNavigationBarItem(
      icon: Icon(Icons.message),
      backgroundColor: Colors.blue,
      title: Text('消息')),
  BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      backgroundColor: Colors.blue,
      title: Text('购物车')),
  BottomNavigationBarItem(
      icon: Icon(Icons.person),
      backgroundColor: Colors.blue,
      title: Text('个人中心')),
];

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Settings", 'router/setting'),
      // getNavItem(Icons.home, "Home", "router/home"),
      getNavItem(Icons.home, "Account", "router/account"),
      aboutChild
    ];
    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          //点击事件
          onTap: (index) {
            _changePage(index);
          },
        ),
        body: pages[currentIndex],
        drawer: getNavDrawer(context),
      ),
    );
  }

  /**
   * 页面切换
   */
  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
