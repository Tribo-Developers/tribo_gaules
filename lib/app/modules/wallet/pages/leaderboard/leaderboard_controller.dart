import 'package:mobx/mobx.dart';

part 'leaderboard_controller.g.dart';

class LeaderboardController = _LeaderboardControllerBase
    with _$LeaderboardController;

abstract class _LeaderboardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
