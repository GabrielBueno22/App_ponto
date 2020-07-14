import 'package:flutter/material.dart';
import 'package:flutter_mobile/data/model/Opcao.dart';
import 'package:mobx/mobx.dart';
part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  List<Opcao> opcoes = [
    Opcao("Perfil", Icon(Icons.person), "/perfil"),
    Opcao("Hora extra", Icon(Icons.alarm_on), "/horaExtra"),
    Opcao("Justificar falta", Icon(Icons.local_hospital), "/falta"),
    Opcao("Jornada de trabalho", Icon(Icons.list), "/jornada"),
    Opcao("Feriados", Icon(Icons.beach_access), "/feriados"),
    Opcao("Sincronizar", Icon(Icons.sync), "/sincronizar"),
    Opcao("Visita", Icon(Icons.directions_car), "/visita"),
    Opcao("Sair", Icon(Icons.input), "/sair")
  ];
}
