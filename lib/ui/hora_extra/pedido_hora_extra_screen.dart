import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/pedido_hora_extra_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class PedidoHoraExtraScreen extends StatefulWidget {
  @override
  _PedidoHoraExtraScreenState createState() => _PedidoHoraExtraScreenState();
}

class _PedidoHoraExtraScreenState extends State<PedidoHoraExtraScreen> {
  final controller = GetIt.I.get<PedidoHoraExtraController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
