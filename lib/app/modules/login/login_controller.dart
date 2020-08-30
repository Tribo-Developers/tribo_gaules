import 'package:Triboneira/app/shared/repositories/local_storage_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILocalStorage localStorage;

  _LoginControllerBase(ILocalStorage this.localStorage);

  @observable
  bool rememberLogin = false;

  @action
  getStatuslogin() async {
    print(await localStorage.getBool("status"));
    if (await localStorage.getBool("status") == null)
      return rememberLogin = false;
    rememberLogin = await localStorage.getBool("status");
    return rememberLogin;
  }

  @observable
  String status = '';

  @action
  setStatusLogin(value) async {
    await localStorage.setBool("status", value);
    rememberLogin = value;
    return await localStorage.setBool("status", value);
  }

  @action
  oauthTwitch() async {
    final url = 'http://localhost:3000/auth/twitch';
    final callbackUrlScheme = 'tribogaules://';

    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: callbackUrlScheme);
      status = 'Got result: $result';
    } on PlatformException catch (e) {
      status = 'Got error: $e';
    }
    return status;
  }
}
