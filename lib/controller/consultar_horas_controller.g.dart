// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultar_horas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultarHorasController on _ConsultarHorasControllerBase, Store {
  Computed<bool> _$isDiaComputed;

  @override
  bool get isDia => (_$isDiaComputed ??= Computed<bool>(() => super.isDia,
          name: '_ConsultarHorasControllerBase.isDia'))
      .value;
  Computed<bool> _$isSemanaComputed;

  @override
  bool get isSemana =>
      (_$isSemanaComputed ??= Computed<bool>(() => super.isSemana,
              name: '_ConsultarHorasControllerBase.isSemana'))
          .value;
  Computed<bool> _$isMesComputed;

  @override
  bool get isMes => (_$isMesComputed ??= Computed<bool>(() => super.isMes,
          name: '_ConsultarHorasControllerBase.isMes'))
      .value;

  final _$dSMAtom = Atom(name: '_ConsultarHorasControllerBase.dSM');

  @override
  String get dSM {
    _$dSMAtom.reportRead();
    return super.dSM;
  }

  @override
  set dSM(String value) {
    _$dSMAtom.reportWrite(value, super.dSM, () {
      super.dSM = value;
    });
  }

  final _$pontosDiaAtom = Atom(name: '_ConsultarHorasControllerBase.pontosDia');

  @override
  List<Ponto> get pontosDia {
    _$pontosDiaAtom.reportRead();
    return super.pontosDia;
  }

  @override
  set pontosDia(List<Ponto> value) {
    _$pontosDiaAtom.reportWrite(value, super.pontosDia, () {
      super.pontosDia = value;
    });
  }

  final _$pontosMesAtom = Atom(name: '_ConsultarHorasControllerBase.pontosMes');

  @override
  List<Ponto> get pontosMes {
    _$pontosMesAtom.reportRead();
    return super.pontosMes;
  }

  @override
  set pontosMes(List<Ponto> value) {
    _$pontosMesAtom.reportWrite(value, super.pontosMes, () {
      super.pontosMes = value;
    });
  }

  final _$listPontosAtom =
      Atom(name: '_ConsultarHorasControllerBase.listPontos');

  @override
  List<Ponto> get listPontos {
    _$listPontosAtom.reportRead();
    return super.listPontos;
  }

  @override
  set listPontos(List<Ponto> value) {
    _$listPontosAtom.reportWrite(value, super.listPontos, () {
      super.listPontos = value;
    });
  }

  final _$_ConsultarHorasControllerBaseActionController =
      ActionController(name: '_ConsultarHorasControllerBase');

  @override
  void setDSM(String value) {
    final _$actionInfo = _$_ConsultarHorasControllerBaseActionController
        .startAction(name: '_ConsultarHorasControllerBase.setDSM');
    try {
      return super.setDSM(value);
    } finally {
      _$_ConsultarHorasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dSM: ${dSM},
pontosDia: ${pontosDia},
pontosMes: ${pontosMes},
listPontos: ${listPontos},
isDia: ${isDia},
isSemana: ${isSemana},
isMes: ${isMes}
    ''';
  }
}
