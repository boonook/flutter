class GlobalConfig {
  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int andVersionCode = 100;
  static String andVersionName = '1.0.0';
  static int iosVersionCode = 200;
  static String iosVersionName = '1.0.2';

  ///当前版本号和版本名称，由于ios打tf包只能用1.0版本，所以升级判断要用自己的配置文件
  static int versionCode = 100;
  static String versionName = '1.0.0';

  //aes加密得key
  static String aesKey = 'GmtWrMXg6ruVzJ1oCRQY9g==';
  //aes加密得CBC模式下的vi
  static String cbcViKey = '92o3jrnf83ikgud7';

  /// true 时打的是测试包  改为正式包要修改 包名 xml provider名称 应用名
  static bool isDebug = false; //是否是调试模式

  /// 生产服务器地址
  static String production = "https://v1.alapi.cn";
  // static String production = "http://api.mtm.bet";
  // static String production = "http://192.168.1.181:8088/";
  static String imgHost = "http://45.64.54.189/";

  // /// 开发服务器地址
  // static String develoment = "http://api.mtm.bet";

  /// 开发服务器地址
  static String develoment = "http://192.168.1.181:8088/";

  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /// 融云appkey
  static String RONGYUNIM_APPKEY = "pwe86ga5pszl6";
}

const APP_ID = 'dd75ce1243be4603b15223da26df01b3';
