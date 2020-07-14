import 'package:mobx/mobx.dart';
part 'pedido_hora_extra_controller.g.dart';

class PedidoHoraExtraController = _PedidoHoraExtraControllerBase
    with _$PedidoHoraExtraController;

abstract class _PedidoHoraExtraControllerBase with Store {
  @observable
  String data;
  @observable
  int horas = 0;
  @observable
  int minutos = 0;
  @observable
  String descricao;

  @action
  setData(String d) => data = d;

  @action
  setHoras(int h) => horas = h;

  @action
  setMinutos(int m) => minutos = m;

  @action
  setDescricao(String desc) => descricao = desc;

  @computed
  bool get canSave {
    if (data != null &&
        data.isNotEmpty &&
        (horas > 0 || minutos > 0) &&
        descricao != null &&
        descricao.isNotEmpty) {
      return true;
    }
    return false;
  }
}
