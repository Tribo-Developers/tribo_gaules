import 'pages/leaderboard/leaderboard_controller.dart';
import 'wallet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'wallet_page.dart';

class WalletModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LeaderboardController()),
        Bind((i) => WalletController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => WalletPage()),
      ];

  static Inject get to => Inject<WalletModule>.of();
}
