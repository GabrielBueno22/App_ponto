// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_hora_extra_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoHoraExtraController on _PedidoHoraExtraControllerBase, Store {
  Computed<bool> _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(() => super.canSave,
          name: '_PedidoHoraExtraControllerBase.canSave'))
      .value;

  final _$dataAtom = Atom(name: '_PedidoHoraExtraControllerBase.data');

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

  final _$horasAtom = Atom(name: '_PedidoHoraExtraControllerBase.horas');

  @override
  int get horas {
    _$horasAtom.reportRead();
    return super.horas;
  }

  @override
  set horas(int value) {
    _$horasAtom.reportWrite(value, super.horas, () {
      super.horas = value;
    });
  }

  final _$minutosAtom = Atom(name: '_PedidoHoraExtraControllerBase.minutos');

  @override
  int get minutos {
    _$minutosAtom.reportRead();
    return super.minutos;
  }

  @override
  set minutos(int value) {
    _$minutosAtom.reportWrite(value, super.minutos, () {
      super.minutos = value;
    });
  }

  final _$descricaoAtom =
      Atom(name: '_PedidoHoraExtraControllerBase.descricao');

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

  final _$_PedidoHoraExtraControllerBaseActionController =
      ActionController(name: '_PedidoHoraExtraControllerBase');

  @override
  dynamic setData(String d) {
    final _$actionInfo = _$_PedidoHoraExtraControllerBaseActionController
        .startAction(name: '_PedidoHoraExtraControllerBase.setData');
    try {
      return super.setData(d);
    } finally {
      _$_PedidoHoraExtraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHoras(int h) {
    final _$actionInfo = _$_PedidoHoraExtraControllerBaseActionController
        .startAction(name: '_PedidoHoraExtraControllerBase.setHoras');
    try {
      return super.setHoras(h);
    } finally {
      _$_PedidoHoraExtraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinutos(int m) {
    final _$actionInfo = _$_PedidoHoraExtraControllerBaseActionController
        .startAction(name: '_PedidoHoraExtraControllerBase.setMinutos');
    try {
      return super.setMinutos(m);
    } finally {
      _$_PedidoHoraExtraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String desc) {
    final _$actionInfo = _$_PedidoHoraExtraControllerBaseActionController
        .startAction(name: '_PedidoHoraExtraControllerBase.setDescricao');
    try {
      return super.setDescricao(desc);
    } finally {
      _$_PedidoHoraExtraControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
horas: ${horas},
minutos: ${minutos},
descricao: ${descricao},
canSave: ${canSave}
    ''';
  }
}
