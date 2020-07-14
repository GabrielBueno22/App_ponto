// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$pontoFinalizadoComputed;

  @override
  bool get pontoFinalizado =>
      (_$pontoFinalizadoComputed ??= Computed<bool>(() => super.pontoFinalizado,
              name: '_HomeControllerBase.pontoFinalizado'))
          .value;

  final _$listPontosAtom = Atom(name: '_HomeControllerBase.listPontos');

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

  final _$listPontosDiaAtom = Atom(name: '_HomeControllerBase.listPontosDia');

  @override
  List<Ponto> get listPontosDia {
    _$listPontosDiaAtom.reportRead();
    return super.listPontosDia;
  }

  @override
  set listPontosDia(List<Ponto> value) {
    _$listPontosDiaAtom.reportWrite(value, super.listPontosDia, () {
      super.listPontosDia = value;
    });
  }

  final _$homeStateAtom = Atom(name: '_HomeControllerBase.homeState');

  @override
  HomeState get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(HomeState value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setHomeState(HomeState state) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setHomeState');
    try {
      return super.setHomeState(state);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPontos: ${listPontos},
listPontosDia: ${listPontosDia},
homeState: ${homeState},
pontoFinalizado: ${pontoFinalizado}
    ''';
  }
}
