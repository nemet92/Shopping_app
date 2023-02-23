// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxStateManagement on _MobxStateManagementBase, Store {
  late final _$serviceCodeAtom =
      Atom(name: '_MobxStateManagementBase.serviceCode', context: context);

  @override
  int? get serviceCode {
    _$serviceCodeAtom.reportRead();
    return super.serviceCode;
  }

  @override
  set serviceCode(int? value) {
    _$serviceCodeAtom.reportWrite(value, super.serviceCode, () {
      super.serviceCode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MobxStateManagementBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_MobxStateManagementBase.isVisible', context: context);

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

  late final _$currentIndexAtom =
      Atom(name: '_MobxStateManagementBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$signUpEmailAndPasswordAsyncAction = AsyncAction(
      '_MobxStateManagementBase.signUpEmailAndPassword',
      context: context);

  @override
  Future<void> signUpEmailAndPassword(UserLoginModel model) {
    return _$signUpEmailAndPasswordAsyncAction
        .run(() => super.signUpEmailAndPassword(model));
  }

  late final _$signInEmailAndPasswordAsyncAction = AsyncAction(
      '_MobxStateManagementBase.signInEmailAndPassword',
      context: context);

  @override
  Future<void> signInEmailAndPassword(UserLoginModel model) {
    return _$signInEmailAndPasswordAsyncAction
        .run(() => super.signInEmailAndPassword(model));
  }

  late final _$_MobxStateManagementBaseActionController =
      ActionController(name: '_MobxStateManagementBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MobxStateManagementBaseActionController.startAction(
        name: '_MobxStateManagementBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MobxStateManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVisibleValue() {
    final _$actionInfo = _$_MobxStateManagementBaseActionController.startAction(
        name: '_MobxStateManagementBase.changeVisibleValue');
    try {
      return super.changeVisibleValue();
    } finally {
      _$_MobxStateManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_MobxStateManagementBaseActionController.startAction(
        name: '_MobxStateManagementBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_MobxStateManagementBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceCode: ${serviceCode},
isLoading: ${isLoading},
isVisible: ${isVisible},
currentIndex: ${currentIndex}
    ''';
  }
}
