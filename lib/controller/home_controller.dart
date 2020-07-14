import 'package:flutter_mobile/data/data_manager.dart';
import 'package:flutter_mobile/data/model/Ponto.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

enum HomeState { IDLE, LOADING, ERROR, SUCCESS, EMPTY }

abstract class _HomeControllerBase with Store {
  @observable
  List<Ponto> listPontos = List();

  @observable
  List<Ponto> listPontosDia = List();

  @observable
  HomeState homeState = HomeState.IDLE;

  @action
  setHomeState(HomeState state) => homeState = state;

  Future getPontos() {
    setHomeState(HomeState.LOADING);
    DateTime dt = DateTime.now();
    listPontos = List();
    listPontosDia = List();
    return DataManager.instance.getAllPonto().then((value) {
      if (value is List<Ponto>) {
        listPontos = value;
        Ponto p;
        List<Ponto> pt = List();
        for (p in listPontos) {
          if (DateTime.parse(p.entrada).day == dt.day &&
              DateTime.parse(p.entrada).month == dt.month &&
              DateTime.parse(p.entrada).year == dt.year) {
            pt.add(p);
          }
        }
        listPontosDia = pt;
        if (listPontosDia.length > 0) {
          setHomeState(HomeState.SUCCESS);
          print("SUCESS");
        } else {
          setHomeState(HomeState.EMPTY);
          print("VAZIA");
        }
        return true;
      } else {
        setHomeState(HomeState.ERROR);
        print("ERRO");
        return false;
      }
    });
  }

  Future updatePonto(Ponto ponto) {
    setHomeState(HomeState.LOADING);
    return DataManager.instance.updatePonto(ponto).then((value) {
      if (value is int) {
        getPontos();
        return true;
      } else {
        return false;
      }
    });
  }

  String horasTrabalhadas() {
    int min = 0;
    int hour = 0;
    String hs;
    String ms;
    Ponto p;
    for (p in listPontosDia) {
      if (p.fim) {
        min +=
            DateTime.parse(p.saida).minute - DateTime.parse(p.entrada).minute;
      } else {
        min += DateTime.now().minute - DateTime.parse(p.entrada).minute;
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

  @computed
  bool get pontoFinalizado {
    if (listPontosDia.length > 0) {
      print(listPontosDia.last.fim);
      if (listPontosDia.last.fim) {
        return true;
      } else {
        return false;
      }
    } else {
      print("Estou aqui");
      return true;
    }
  }
}
