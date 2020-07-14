import 'package:mobx/mobx.dart';
part 'justificar_falta_controller.g.dart';

class JustificarFaltaController = _JustificarFaltaControllerBase
    with _$JustificarFaltaController;

abstract class _JustificarFaltaControllerBase with Store {
  @observable
  String data;

  @observable
  bool diaTodo = false;

  @observable
  double duracao;

  @observable
  String repetirPor = "Apenas um dia";

  @observable
  String descricao;

  @action
  setData(String d) => data = d;

  @action
  setDiaTodo() {
    if (diaTodo) {
      diaTodo = false;
    } else {
      diaTodo = true;
    }
  }

  @action
  setDuracao(double d) => duracao = d;

  @action
  setRepetirPor(String r) => repetirPor = r;

  @action
  setDescricao(String d) => descricao = d;

  @computed
  bool get validarValores {
    if (diaTodo) {
      if (data != null && descricao != null) {
        return true;
      } else {
        return false;
      }
    } else {
      if (data != null && duracao != null && descricao != null) {
        return true;
      } else {
        return false;
      }
    }
  }

  @computed
  bool get isChecked {
    return diaTodo;
  }
}
