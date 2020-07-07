import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/perfil_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final controller = GetIt.I.get<PerfilController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
