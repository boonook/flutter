import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/Utils/storage_util.dart';
part 'authinfo.g.dart';

class Authinfo = _Authinfo with _$Authinfo;

abstract class _Authinfo with Store {
  @observable
  int value = 0;
  @observable
  bool isLogin = false;
  @observable
  String token = '';
  @observable
  String userInfo = '';

  @action
  void increment() {
    value++;
  }

  @action
  Future<dynamic> changeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    StorageUtil.setStringItem('token', '123123123123123123123123');
  }
}
