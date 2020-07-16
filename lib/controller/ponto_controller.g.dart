// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ponto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PontoController on _PontoControllerBase, Store {
  Computed<bool> _$distanciaEmpresaComputed;

  @override
  bool get distanciaEmpresa => (_$distanciaEmpresaComputed ??= Computed<bool>(
          () => super.distanciaEmpresa,
          name: '_PontoControllerBase.distanciaEmpresa'))
      .value;

  final _$distanceAtom = Atom(name: '_PontoControllerBase.distance');

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  final _$isVisitaAtom = Atom(name: '_PontoControllerBase.isVisita');

  @override
  bool get isVisita {
    _$isVisitaAtom.reportRead();
    return super.isVisita;
  }

  @override
  set isVisita(bool value) {
    _$isVisitaAtom.reportWrite(value, super.isVisita, () {
      super.isVisita = value;
    });
  }

  final _$intervaloAtom = Atom(name: '_PontoControllerBase.intervalo');

  @override
  String get intervalo {
    _$intervaloAtom.reportRead();
    return super.intervalo;
  }

  @override
  set intervalo(String value) {
    _$intervaloAtom.reportWrite(value, super.intervalo, () {
      super.intervalo = value;
    });
  }

  final _$clienteAtom = Atom(name: '_PontoControllerBase.cliente');

  @override
  String get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(String value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_PontoControllerBase.descricao');

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

  final _$markerAtom = Atom(name: '_PontoControllerBase.marker');

  @override
  Marker get marker {
    _$markerAtom.reportRead();
    return super.marker;
  }

  @override
  set marker(Marker value) {
    _$markerAtom.reportWrite(value, super.marker, () {
      super.marker = value;
    });
  }

  final _$circleAtom = Atom(name: '_PontoControllerBase.circle');

  @override
  Circle get circle {
    _$circleAtom.reportRead();
    return super.circle;
  }

  @override
  set circle(Circle value) {
    _$circleAtom.reportWrite(value, super.circle, () {
      super.circle = value;
    });
  }

  final _$_PontoControllerBaseActionController =
      ActionController(name: '_PontoControllerBase');

  @override
  dynamic setIsVisita(bool b) {
    final _$actionInfo = _$_PontoControllerBaseActionController.startAction(
        name: '_PontoControllerBase.setIsVisita');
    try {
      return super.setIsVisita(b);
    } finally {
      _$_PontoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIntervalo(String s) {
    final _$actionInfo = _$_PontoControllerBaseActionController.startAction(
        name: '_PontoControllerBase.setIntervalo');
    try {
      return super.setIntervalo(s);
    } finally {
      _$_PontoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCliente(String s) {
    final _$actionInfo = _$_PontoControllerBaseActionController.startAction(
        name: '_PontoControllerBase.setCliente');
    try {
      return super.setCliente(s);
    } finally {
      _$_PontoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(String s) {
    final _$actionInfo = _$_PontoControllerBaseActionController.startAction(
        name: '_PontoControllerBase.setDescricao');
    try {
      return super.setDescricao(s);
    } finally {
      _$_PontoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
distance: ${distance},
isVisita: ${isVisita},
intervalo: ${intervalo},
cliente: ${cliente},
descricao: ${descricao},
marker: ${marker},
circle: ${circle},
distanciaEmpresa: ${distanciaEmpresa}
    ''';
  }
}
