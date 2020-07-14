import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_mobile/data/model/Feriados.dart';
import 'package:mobx/mobx.dart';
part 'feriado_controller.g.dart';

class FeriadoController = _FeriadoControllerBase with _$FeriadoController;

abstract class _FeriadoControllerBase with Store {
  List<Feriados> feriados;
  _FeriadoControllerBase() {
    loadAsset().then((value) => parseJson(value));
  }

  void parseJson(String response) {
    if (response == null) {
      feriados = [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    feriados =
        parsed.map<Feriados>((json) => new Feriados.fromJson(json)).toList();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('feriados.json');
  }
}
