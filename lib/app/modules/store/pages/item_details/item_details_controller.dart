import 'package:mobx/mobx.dart';

part 'item_details_controller.g.dart';

class ItemDetailsController = _ItemDetailsControllerBase
    with _$ItemDetailsController;

abstract class _ItemDetailsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
