import 'package:flutter/material.dart';
import '../Utils/cache_util.dart';
import '../Utils/tools.dart';

class PersonPage extends StatefulWidget {
  const PersonPage();
  @override
  PersonPageState createState() => PersonPageState();
}

class PersonPageState extends State<PersonPage> {
  @override
  void initState() {
    super.initState();
    print('123123123123123123123');
    initCache();
  }

  dynamic cacheSize = {};
  Future<void> initCache() async {
    /// 获取缓存大小
    int size = await CacheUtil.total();
    print(size);

    /// 复制变量
    cacheSize.value = size;
  }

  Future<void> handleClearCache() async {
    try {
      if (cacheSize.value <= 0) throw '没有缓存可清理';

      /// 给予适当的提示
      /// bool confirm = await showDialog();
      /// if (confirm != true) return;

      /// 执行清除缓存
      await CacheUtil.clear();

      /// 更新缓存
      await initCache();
      tools.showToast('缓存清除成功');
    } catch (e) {
      tools.showToast(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("点击跳转"),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("router/setting");
                },
                child: Text("设置"),
              ),
              RaisedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Text("打开侧边栏"),
              ),
              Stack(children: <Widget>[
                Image.network(
                    'http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
                Positioned(
                  left: 35.0,
                  right: 35.0,
                  top: 45.0,
                  child: Text(
                    'Whatever is worth doing is worth doing well. ๑•ิ.•ั๑',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'serif',
                    ),
                  ),
                ),
                Positioned(
                  left: 35.0,
                  right: 35.0,
                  top: 90.0,
                  child: Text('定位',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'serif',
                      )),
                ),
              ]),
              Stack(children: <Widget>[
                Image.network(
                    'http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
                Positioned(
                  left: 35.0,
                  right: 35.0,
                  top: 45.0,
                  child: Text(
                    'Whatever is worth doing is worth doing well. ๑•ิ.•ั๑',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'serif',
                    ),
                  ),
                ),
                Positioned(
                  left: 35.0,
                  right: 35.0,
                  top: 90.0,
                  child: Text('定位',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'serif',
                      )),
                ),
              ]),
              MaterialButton(
                color: Colors.blue,
                child: Text('点我'),
                onPressed: () {
                  showDialog<Null>(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('选择'),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Text('选项 1'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SimpleDialogOption(
                            child: Text('选项 2'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ).then((val) {
                    print(val);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
