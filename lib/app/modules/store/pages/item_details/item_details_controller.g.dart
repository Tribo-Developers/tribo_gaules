// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemDetailsController on _ItemDetailsControllerBase, Store {
  final _$valueAtom = Atom(name: '_ItemDetailsControllerBase.value');

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

  final _$_ItemDetailsControllerBaseActionController =
      ActionController(name: '_ItemDetailsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ItemDetailsControllerBaseActionController
        .startAction(name: '_ItemDetailsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ItemDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
