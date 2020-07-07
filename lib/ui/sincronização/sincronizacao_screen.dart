import 'controller/sincronizacao_controller.dart';
import 'navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/cupertino.dart';

class SincronizacaoScreen extends StatefulWidget {
  @override
  _SincronizacaoScreenState createState() => _SincronizacaoScreenState();
}

class _SincronizacaoScreenState extends State<SincronizacaoScreen> {
  final controller = GetIt.I.get<SincronizacaoController>();
  final navigator = GetIt.I.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
