import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/justificar_falta_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class JustificarFaltaScreen extends StatefulWidget {
  @override
  _JustificarFaltaScreenState createState() => _JustificarFaltaScreenState();
}

class _JustificarFaltaScreenState extends State<JustificarFaltaScreen> {
  final controller = GetIt.I.get<JustificarFaltaController>();
  final navigator = GetIt.I.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
