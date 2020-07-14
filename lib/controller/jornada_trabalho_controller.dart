import 'package:flutter_mobile/data/model/DiaTrabalho.dart';
import 'package:mobx/mobx.dart';
part 'jornada_trabalho_controller.g.dart';

class JornadaTrabalhoController = _JornadaTrabalhoControllerBase
    with _$JornadaTrabalhoController;

abstract class _JornadaTrabalhoControllerBase with Store {
  List<DiaTrabalho> jornada = [
    DiaTrabalho("Domingo", "00:00", null),
    DiaTrabalho("Segunda-Feira", "08:00>12:00 - 13:00>17:00", "Carga: 08:00"),
    DiaTrabalho("Terça-Feira", "08:00>12:00 - 13:00>17:00", "Carga: 08:00"),
    DiaTrabalho("Quarta-Feira", "08:00>12:00 - 13:00>17:00", "Carga: 08:00"),
    DiaTrabalho("Quinta-Feira", "08:00>12:00 - 13:00>17:00", "Carga: 08:00"),
    DiaTrabalho("Sexta-Feira", "08:00>12:00 - 13:00>17:00", "Carga: 08:00"),
    DiaTrabalho("Sábado", "00:00", null)
  ];
}
