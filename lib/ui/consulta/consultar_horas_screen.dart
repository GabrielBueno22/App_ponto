import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/consultar_horas_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class ConsultarHorasScreen extends StatefulWidget {
  @override
  _ConsultarHorasScreenState createState() => _ConsultarHorasScreenState();
}

class _ConsultarHorasScreenState extends State<ConsultarHorasScreen> {
  final controller = GetIt.I.get<ConsultarHorasController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
