// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authinfo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Authinfo on _Authinfo, Store {
  final _$valueAtom = Atom(name: '_Authinfo.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$isLoginAtom = Atom(name: '_Authinfo.isLogin');

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  final _$tokenAtom = Atom(name: '_Authinfo.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$userInfoAtom = Atom(name: '_Authinfo.userInfo');

  @override
  String get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(String value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  final _$changeUserInfoAsyncAction = AsyncAction('_Authinfo.changeUserInfo');

  @override
  Future<dynamic> changeUserInfo() {
    return _$changeUserInfoAsyncAction.run(() => super.changeUserInfo());
  }

  final _$_AuthinfoActionController = ActionController(name: '_Authinfo');

  @override
  void increment() {
    final _$actionInfo =
        _$_AuthinfoActionController.startAction(name: '_Authinfo.increment');
    try {
      return super.increment();
    } finally {
      _$_AuthinfoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
isLogin: ${isLogin},
token: ${token},
userInfo: ${userInfo}
    ''';
  }
}
