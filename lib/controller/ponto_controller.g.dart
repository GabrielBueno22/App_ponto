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

  @override
  String toString() {
    return '''
distance: ${distance},
marker: ${marker},
circle: ${circle},
distanciaEmpresa: ${distanciaEmpresa}
    ''';
  }
}
