// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login on _LoginBase, Store {
  final _$userAtom = Atom(name: '_LoginBase.user');

  @override
  String get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$pwdAtom = Atom(name: '_LoginBase.pwd');

  @override
  String get pwd {
    _$pwdAtom.context.enforceReadPolicy(_$pwdAtom);
    _$pwdAtom.reportObserved();
    return super.pwd;
  }

  @override
  set pwd(String value) {
    _$pwdAtom.context.conditionallyRunInAction(() {
      super.pwd = value;
      _$pwdAtom.reportChanged();
    }, _$pwdAtom, name: '${_$pwdAtom.name}_set');
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic setUser(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setUser(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPwd(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.setPwd(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }
}
