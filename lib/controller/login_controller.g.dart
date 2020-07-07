// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;
  Computed<String> _$validateUserComputed;

  @override
  String get validateUser =>
      (_$validateUserComputed ??= Computed<String>(() => super.validateUser))
          .value;
  Computed<String> _$validateEmailComputed;

  @override
  String get validateEmail =>
      (_$validateEmailComputed ??= Computed<String>(() => super.validateEmail))
          .value;
  Computed<String> _$validateCPFComputed;

  @override
  String get validateCPF =>
      (_$validateCPFComputed ??= Computed<String>(() => super.validateCPF))
          .value;
  Computed<String> _$validatePwdComputed;

  @override
  String get validatePwd =>
      (_$validatePwdComputed ??= Computed<String>(() => super.validatePwd))
          .value;

  final _$stateLoginAtom = Atom(name: '_LoginControllerBase.stateLogin');

  @override
  LoginState get stateLogin {
    _$stateLoginAtom.context.enforceReadPolicy(_$stateLoginAtom);
    _$stateLoginAtom.reportObserved();
    return super.stateLogin;
  }

  @override
  set stateLogin(LoginState value) {
    _$stateLoginAtom.context.conditionallyRunInAction(() {
      super.stateLogin = value;
      _$stateLoginAtom.reportChanged();
    }, _$stateLoginAtom, name: '${_$stateLoginAtom.name}_set');
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setStateLogin(LoginState state) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setStateLogin(state);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
