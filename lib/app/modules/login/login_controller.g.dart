// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$rememberLoginAtom = Atom(name: '_LoginControllerBase.rememberLogin');

  @override
  bool get rememberLogin {
    _$rememberLoginAtom.reportRead();
    return super.rememberLogin;
  }

  @override
  set rememberLogin(bool value) {
    _$rememberLoginAtom.reportWrite(value, super.rememberLogin, () {
      super.rememberLogin = value;
    });
  }

  final _$statusAtom = Atom(name: '_LoginControllerBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getStatusloginAsyncAction =
      AsyncAction('_LoginControllerBase.getStatuslogin');

  @override
  Future getStatuslogin() {
    return _$getStatusloginAsyncAction.run(() => super.getStatuslogin());
  }

  final _$setStatusLoginAsyncAction =
      AsyncAction('_LoginControllerBase.setStatusLogin');

  @override
  Future setStatusLogin(dynamic value) {
    return _$setStatusLoginAsyncAction.run(() => super.setStatusLogin(value));
  }

  final _$oauthTwitchAsyncAction =
      AsyncAction('_LoginControllerBase.oauthTwitch');

  @override
  Future oauthTwitch() {
    return _$oauthTwitchAsyncAction.run(() => super.oauthTwitch());
  }

  @override
  String toString() {
    return '''
rememberLogin: ${rememberLogin},
status: ${status}
    ''';
  }
}
