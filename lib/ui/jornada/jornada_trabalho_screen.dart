import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Jornada de trabalho"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: controller.jornada.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(5),
              child: Container(
                margin: EdgeInsets.all(5),
                child: ListTile(
                    title: Container(
                      child: Text(controller.jornada[index].dia),
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 2,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(controller.jornada[index].horarios,
                              textAlign: TextAlign.left),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.time,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text(controller.jornada[index].carga != null
                                ? controller.jornada[index].carga
                                : "Você não trabalha neste dia"),
                          ],
                        ),
                      ],
                    ),
                    onTap: null),
              ),
            );
          },
        ),
      ),
    );
  }
}
