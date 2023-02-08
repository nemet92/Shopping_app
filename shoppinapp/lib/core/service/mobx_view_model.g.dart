// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewMode on _LoginViewModeBase, Store {
  late final _$isVisibleAtom =
      Atom(name: '_LoginViewModeBase.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$_LoginViewModeBaseActionController =
      ActionController(name: '_LoginViewModeBase', context: context);

  @override
  dynamic changeVisibleValue() {
    final _$actionInfo = _$_LoginViewModeBaseActionController.startAction(
        name: '_LoginViewModeBase.changeVisibleValue');
    try {
      return super.changeVisibleValue();
    } finally {
      _$_LoginViewModeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible}
    ''';
  }
}
