import 'package:flutter_mobile/data/data_manager.dart';
import 'package:flutter_mobile/data/model/Ponto.dart';
import 'package:flutter_mobile/util/stringUtil.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'consultar_horas_controller.g.dart';

class ConsultarHorasController = _ConsultarHorasControllerBase
    with _$ConsultarHorasController;

abstract class _ConsultarHorasControllerBase with Store {
  @observable
  String dSM = "Dia";

  @observable
  List<Ponto> pontosDia = List();

  @observable
  List<Ponto> pontosMes = List();

  @action
  void setDSM(String value) => dSM = value;

  @observable
  List<Ponto> listPontos = List();

  Future getPontos() {
    DateTime dt = DateTime.now();
    listPontos = List();
    return DataManager.instance.getAllPonto().then((value) {
      if (value is List<Ponto>) {
        listPontos = value;

        if (listPontos.length > 0) {
          print("SUCESS");
        } else {
          print("VAZIA");
        }
        return true;
      } else {
        print("ERRO");
        return false;
      }
    });
  }

  void buscarPonto(DateTime dt) {
    if (listPontos.length > 0) {
      pontosDia = listPontos
          .where((element) =>
              DateTime.parse(element.entrada).day == dt.day &&
              DateTime.parse(element.entrada).month == dt.month)
          .toList();
      print(pontosDia);
    } else {
      getPontos().then((value) => buscarPonto(DateTime.now()));
    }
  }

  void buscarPontoMes(DateTime dt) {
    if (listPontos.length > 0) {
      pontosMes = listPontos
          .where((element) =>
              DateTime.parse(element.entrada).month == dt.month &&
              DateTime.parse(element.entrada).year == dt.year)
          .toList();
      print("Meses: " + pontosMes.toString());
    } else {
      getPontos().then((value) => buscarPontoMes(DateTime.now()));
    }
  }

  String horasTrabalhadas() {
    int min = 0;
    int hour = 0;
    String hs;
    String ms;
    Ponto p;
    for (p in pontosDia) {
      if (p.fim) {
        min += DateTime.parse(p.saida)
            .toUtc()
            .difference(DateTime.parse(p.entrada).toUtc())
            .inMinutes;
      } else {
        min += DateTime.now()
            .toUtc()
            .difference(DateTime.parse(p.entrada).toUtc())
            .inMinutes;
      }
      print("for: " + min.toString());
    }
    print("Dia" + min.toString());
    hour = (min / 60).floor();
    min = min - hour * 60;
    hs = hour.toString();
    ms = min.toString();
    if (hour < 10) {
      hs = "0" + hour.toString();
    }
    if (min < 10) {
      ms = "0" + min.toString();
    }
    return hs + ":" + ms;
  }

  String horasTrabalhadasMes() {
    int min = 0;
    int hour = 0;
    String hs;
    String ms;
    Ponto p;
    for (p in pontosMes) {
      if (p.fim) {
        min += DateTime.parse(p.saida)
            .toUtc()
            .difference(DateTime.parse(p.entrada).toUtc())
            .inMinutes;
      } else {
        min += DateTime.now()
            .toUtc()
            .difference(DateTime.parse(p.entrada).toUtc())
            .inMinutes;
      }
    }
    hour = (min / 60).floor();
    min = min - hour * 60;
    hs = hour.toString();
    ms = min.toString();
    if (hour < 10) {
      hs = "0" + hour.toString();
    }
    if (min < 10) {
      ms = "0" + min.toString();
    }
    return hs + ":" + ms;
  }

  String saldo(String horas) {
    List<String> list = List();
    list = StringUtil.convertHour(horas);

    int h = int.parse(list[0]);
    int min = int.parse(list[1]);
    int result = 0;
    if (isDia) {
      result = (8 * 60) - ((h * 60) + min);
    }
    if (isSemana) {
      result = (40 * 60) - ((h * 60) + min);
    }
    if (isMes) {
      result = (160 * 60) - ((h * 60) + min);
    }
    h = (result / 60).floor();
    min = result - (h * 60);
    list = List();
    list.add(h.toString());
    list.add(min.toString());
    if (h < 10) {
      list[0] = "0" + h.toString();
    }
    if (min < 10) {
      list[1] = "0" + min.toString();
    }
    return list[0] + ":" + list[1];
  }

  @computed
  bool get isDia {
    if (dSM == "Dia") {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get isSemana {
    if (dSM == "Semana") {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get isMes {
    if (dSM == "Mês") {
      return true;
    } else {
      return false;
    }
  }
}
