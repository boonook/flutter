import 'package:scoped_model/scoped_model.dart';

class contants extends Model {
  String _name = "13123123123";
  int _count = 0;

  String get name {
    return _name;
  }

  int get count {
    return _count;
  }

  void updateName(String name) {
    _name = name;
  }

  void incrementCount() {
    _count += 1;
  }
}
