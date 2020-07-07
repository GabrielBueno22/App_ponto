import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/visita_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class VisitaScreen extends StatefulWidget {
  @override
  _VisitaScreenState createState() => _VisitaScreenState();
}

class _VisitaScreenState extends State<VisitaScreen> {
  final controller = GetIt.I.get<VisitaController>();
  final navigator = GetIt.I.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
