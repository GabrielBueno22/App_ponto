import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/ponto_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class PontoScreen extends StatefulWidget {
  @override
  _PontoScreenState createState() => _PontoScreenState();
}

class _PontoScreenState extends State<PontoScreen> {
  final controller = GetIt.I.get<PontoController>();
  final navigator = GetIt.I.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
