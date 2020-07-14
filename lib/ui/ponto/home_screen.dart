import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/home_controller.dart';
import 'package:flutter_mobile/data/model/Ponto.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobile/util/colorUtil.dart';
import 'package:flutter_mobile/util/stringUtil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = GetIt.I.get<HomeController>();
  final navigator = GetIt.I.get<NavigationService>();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    controller.getPontos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringUtil.getWeekDay(selectedDate.weekday) +
            ", " +
            selectedDate.day.toString() +
            " de " +
            StringUtil.getMonth(selectedDate.month)),
        centerTitle: true,
        actions: null,
        leading: null,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                const Color(0xFFfa7d09),
                const Color(0xFFff4301),
              ], // whitish to gray
              tileMode: TileMode.mirror // repeats the gradient over the canvas
              ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      "Olá,",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          color: Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                      margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Usuário",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "HORAS TRABALHADAS",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.013,
                                    color: Colors.white),
                              )),
                          Observer(builder: (_) {
                            return Container(
                                padding: EdgeInsets.only(left: 5),
                                child: controller.homeState == HomeState.SUCCESS
                                    ? Text(
                                        controller.horasTrabalhadas(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.white),
                                      )
                                    : Text(
                                        "00:00",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.025,
                                            color: Colors.white),
                                      ));
                          }),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              child: Text(
                            "ATRASOS",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.013,
                                color: Colors.white),
                          )),
                          Container(
                              child: Text(
                            "00:00",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                                color: Colors.white),
                          )),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                "HORAS EXTRAS",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.013,
                                    color: Colors.white),
                              )),
                          Container(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                "00:00",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.white),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Observer(builder: (_) {
                switch (controller.homeState) {
                  case HomeState.LOADING:
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      height: MediaQuery.of(context).size.height * 0.545,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.orange,
                      )),
                    );
                    break;
                  case HomeState.SUCCESS:
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                      height: MediaQuery.of(context).size.height * 0.545,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Observer(builder: (_) {
                        return ListView.builder(
                            itemCount: controller.listPontosDia.length,
                            itemBuilder: (context, index) {
                              DateTime saida;
                              DateTime entrada = DateTime.parse(
                                  controller.listPontosDia[index].entrada);
                              print(entrada);
                              controller.listPontosDia[index].fim
                                  ? saida = DateTime.parse(
                                      controller.listPontosDia[index].saida)
                                  : saida = DateTime.now();
                              List<String> intervalos = [
                                "Almoço",
                                "Intervalo",
                                "Jantar",
                              ];
                              intervalos.shuffle();

                              return Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 7, 30, 5),
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.orange
                                                  .withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0, 0))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                "Entrada: " +
                                                    StringUtil.convertTime(
                                                        entrada),
                                                style: TextStyle(
                                                    color: Colors.orange),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            controller.listPontosDia[index].fim
                                                ? Container(
                                                    child: Text(
                                                      "Saída: " +
                                                          StringUtil
                                                              .convertTime(
                                                                  saida),
                                                      style: TextStyle(
                                                          color: Colors.orange),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  )
                                                : Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Saída:",
                                                      style: TextStyle(
                                                          color: Colors.orange),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Total: " +
                                                    StringUtil.compare(
                                                        saida, entrada),
                                                style: TextStyle(
                                                    color: ColorUtil.darkGrey),
                                                textAlign: TextAlign.start,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                    child: Text(
                                        index ==
                                                controller
                                                        .listPontosDia.length -
                                                    1
                                            ? "Fim de expediente"
                                            : intervalos[0],
                                        style: TextStyle(color: Colors.grey)),
                                  )
                                ],
                              );
                            });
                      }),
                    );
                  case HomeState.EMPTY:
                    return Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        height: MediaQuery.of(context).size.height * 0.545,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarm,
                              color: Colors.grey,
                              size: MediaQuery.of(context).size.height * 0.1,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Text("Não há pontos cadastrados hoje"),
                          ],
                        ));
                    break;
                  default:
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.545,
                      decoration: BoxDecoration(color: Colors.white),
                    );
                }
              }),
            ),
          ]),
        ),
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.homeState == HomeState.SUCCESS) {
          return GestureDetector(
            onTap: controller.listPontosDia.last.fim
                ? () {
                    navigator
                        .navigateTo("/ponto", arguments: {"ponto": Ponto()});
                  }
                : () {
                    navigator.navigateTo("/ponto",
                        arguments: {"ponto": controller.listPontosDia.last});
                  },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  shape: BoxShape.rectangle,
                  color: const Color(0xFFcf7500),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    controller.listPontosDia.last.fim
                        ? Text(
                            "Entrada",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "Saída",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    )
                  ],
                )),
          );
        } else if (controller.homeState == HomeState.EMPTY) {
          return GestureDetector(
            onTap: () {
              navigator.navigateTo("/ponto", arguments: {"ponto": Ponto()});
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    shape: BoxShape.rectangle,
                    color: const Color(0xFFcf7500)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Entrada",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    )
                  ],
                )),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
