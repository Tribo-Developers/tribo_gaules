import 'package:mobx/mobx.dart';

part 'store_controller.g.dart';

class StoreController = _StoreControllerBase with _$StoreController;

abstract class _StoreControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
