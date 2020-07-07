import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/jornada_trabalho_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class JornadaTrabalhoScreen extends StatefulWidget {
  @override
  _JornadaTrabalhoScreenState createState() => _JornadaTrabalhoScreenState();
}

class _JornadaTrabalhoScreenState extends State<JornadaTrabalhoScreen> {
  final controller = GetIt.I.get<JornadaTrabalhoController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
