// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'justificar_falta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JustificarFaltaController on _JustificarFaltaControllerBase, Store {
  Computed<bool> _$validarValoresComputed;

  @override
  bool get validarValores =>
      (_$validarValoresComputed ??= Computed<bool>(() => super.validarValores,
              name: '_JustificarFaltaControllerBase.validarValores'))
          .value;
  Computed<bool> _$isCheckedComputed;

  @override
  bool get isChecked =>
      (_$isCheckedComputed ??= Computed<bool>(() => super.isChecked,
              name: '_JustificarFaltaControllerBase.isChecked'))
          .value;

  final _$dataAtom = Atom(name: '_JustificarFaltaControllerBase.data');

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$diaTodoAtom = Atom(name: '_JustificarFaltaControllerBase.diaTodo');

  @override
  bool get diaTodo {
    _$diaTodoAtom.reportRead();
    return super.diaTodo;
  }

  @override
  set diaTodo(bool value) {
    _$diaTodoAtom.reportWrite(value, super.diaTodo, () {
      super.diaTodo = value;
    });
  }

  final _$duracaoAtom = Atom(name: '_JustificarFaltaControllerBase.duracao');

  @override
  double get duracao {
    _$duracaoAtom.reportRead();
    return super.duracao;
  }

  @override
  set duracao(double value) {
    _$duracaoAtom.reportWrite(value, super.duracao, () {
      super.duracao = value;
    });
  }

  final _$repetirPorAtom =
      Atom(name: '_JustificarFaltaControllerBase.repetirPor');

  @override
  String get repetirPor {
    _$repetirPorAtom.reportRead();
    return super.repetirPor;
  }

  @override
  set repetirPor(String value) {
    _$repetirPorAtom.reportWrite(value, super.repetirPor, () {
      super.repetirPor = value;
    });
  }

  final _$descricaoAtom =
      Atom(name: '_JustificarFaltaControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$_JustificarFaltaControllerBaseActionController =
      ActionController(name: '_JustificarFaltaControllerBase');

  @override
  dynamic setData(String d) {
    final _$actionInfo = _$_JustificarFaltaControllerBaseActionController
        .startAction(name: '_JustificarFaltaControllerBase.setData');
    try {
      return super.setData(d);
    } finally {
      _$_JustificarFaltaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDiaTodo() {
    final _$actionInfo = _$_JustificarFaltaControllerBaseActionController
        .startAction(name: '_JustificarFaltaControllerBase.setDiaTodo');
    try {
      return super.setDiaTodo();
    } finally {
      _$_JustificarFaltaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDuracao(double d) {
    final _$actionInfo = _$_JustificarFaltaControllerBaseActionController
        .startAction(name: '_JustificarFaltaControllerBase.setDuracao');
    try {
      return super.setDuracao(d);
    } finally {
      _$_JustificarFaltaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRepetirPor(String r) {
    final _$actionInfo = _$_JustificarFaltaControllerBaseActionController
        .startAction(name: '_JustificarFaltaControllerBase.setRepetirPor');
    try {
      return super.setRepetirPor(r);
    } finally {
      _$_JustificarFaltaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String d) {
    final _$actionInfo = _$_JustificarFaltaControllerBaseActionController
        .startAction(name: '_JustificarFaltaControllerBase.setDescricao');
    try {
      return super.setDescricao(d);
    } finally {
      _$_JustificarFaltaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
diaTodo: ${diaTodo},
duracao: ${duracao},
repetirPor: ${repetirPor},
descricao: ${descricao},
validarValores: ${validarValores},
isChecked: ${isChecked}
    ''';
  }
}
