import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/feriado_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class FeriadosScreen extends StatefulWidget {
  @override
  _FeriadosScreenState createState() => _FeriadosScreenState();
}

class _FeriadosScreenState extends State<FeriadosScreen> {
  final controller = GetIt.I.get<FeriadoController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Feriados"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: controller.feriados.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(5),
              child: Container(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Container(
                      child: Text(controller.feriados[index].title),
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    subtitle: Text(controller.feriados[index].date.isNotEmpty
                        ? controller.feriados[index].date
                        : controller.feriados[index].variableDates["2020"]),
                    onTap: null,
                  )),
            );
          },
        ),
      ),
    );
  }
}
