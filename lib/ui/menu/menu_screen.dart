import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/menu_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = GetIt.I.get<MenuController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mais opções"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: controller.opcoes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(controller.opcoes[index].titulo),
                leading: controller.opcoes[index].icone,
                onTap: () {
                  navigator.navigateTo(controller.opcoes[index].rota);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
