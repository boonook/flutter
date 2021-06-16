import 'package:mobx/mobx.dart';
import 'package:my_app/Utils/storage_util.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void increment() async {
    value++;
    StorageUtil.setStringItem('token', '123123123123123123123123');
    String token = await StorageUtil.getStringItem('token');
    print('----------token------------' + token);
  }
}
