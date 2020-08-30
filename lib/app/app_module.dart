import 'package:Triboneira/app/app_controller.dart';
import 'package:Triboneira/app/modules/login/login_module.dart';
import 'package:Triboneira/app/shared/repositories/local_storage.dart';
import 'package:Triboneira/app/shared/repositories/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:Triboneira/app/app_widget.dart';
import 'package:Triboneira/app/modules/home/home_module.dart';

import 'modules/login/login_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController(i.get())),
        Bind<ILocalStorage>((i) => LocalStorage()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/home',
            module: HomeModule(), transition: TransitionType.fadeIn),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
