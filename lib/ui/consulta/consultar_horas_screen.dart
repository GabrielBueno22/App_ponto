import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/consultar_horas_controller.dart';
import 'package:flutter_mobile/util/colorUtil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobile/util/stringUtil.dart';

class ConsultarHorasScreen extends StatefulWidget {
  @override
  _ConsultarHorasScreenState createState() => _ConsultarHorasScreenState();
}

class _ConsultarHorasScreenState extends State<ConsultarHorasScreen> {
  final controller = GetIt.I.get<ConsultarHorasController>();
  final navigator = GetIt.I.get<NavigationService>();
  DateTime dateTime = DateTime.now();
  DateTime dateTimeM = DateTime.now();

  @override
  void initState() {
    controller.getPontos().then((value) {
      controller.buscarPonto(dateTime);
      controller.buscarPontoMes(dateTimeM);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RELATÓRIOS"),
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
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFfa7d09),
                const Color(0xFFff4301),
                Colors.white
              ],
              tileMode: TileMode
                  .repeated // whitish to gray// repeats the gradient over the canvas
              ),
        ),
        child: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Observer(builder: (_) {
                          return Container(
                            decoration: BoxDecoration(
                                color: controller.isDia
                                    ? Color(0xFFff4301).withOpacity(0.7)
                                    : null,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: FlatButton(
                                onPressed: () {
                                  controller.setDSM("Dia");
                                },
                                child: Text(
                                  "Dia",
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }),
                        Observer(builder: (_) {
                          return Container(
                            decoration: BoxDecoration(
                                color: controller.isSemana
                                    ? Color(0xFFff4301).withOpacity(0.7)
                                    : null,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: FlatButton(
                                onPressed: () {
                                  controller.setDSM("Semana");
                                },
                                child: Text(
                                  "Semana",
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }),
                        Observer(builder: (_) {
                          return Container(
                            decoration: BoxDecoration(
                                color: controller.isMes
                                    ? Color(0xFFff4301).withOpacity(0.7)
                                    : null,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: FlatButton(
                                onPressed: () {
                                  controller.setDSM("Mês");
                                },
                                child: Text(
                                  "Mês",
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Observer(builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.keyboard_arrow_left),
                            onPressed: controller.isDia
                                ? () {
                                    setState(() {
                                      dateTime =
                                          StringUtil.previousDay(dateTime);
                                      controller.buscarPonto(dateTime);
                                    });
                                  }
                                : controller.isSemana
                                    ? null
                                    : () {
                                        setState(() {
                                          dateTimeM = dateTimeM
                                              .subtract(new Duration(days: 30));
                                          controller.buscarPontoMes(dateTimeM);
                                        });
                                      }),
                        controller.isDia
                            ? Column(
                                children: <Widget>[
                                  Text(
                                    "Dia",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    StringUtil.convertDate(dateTime),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            : controller.isSemana
                                ? Column(
                                    children: <Widget>[
                                      Text(
                                        "3ª Semana de Julho",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "11/07/2020 - 18/07/2020",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: <Widget>[
                                      Text(
                                        StringUtil.getMonth(dateTimeM.month),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                        IconButton(
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: controller.isDia
                                ? () {
                                    setState(() {
                                      dateTime = StringUtil.nextDay(dateTime);
                                      controller.buscarPonto(dateTime);
                                    });
                                  }
                                : controller.isSemana
                                    ? null
                                    : () {
                                        if (dateTimeM.month ==
                                                DateTime.now().month &&
                                            dateTimeM.year ==
                                                DateTime.now().year) {
                                          controller.buscarPontoMes(dateTimeM);
                                        } else {
                                          setState(() {
                                            dateTimeM = dateTimeM
                                                .add(new Duration(days: 30));
                                          });
                                          controller.buscarPontoMes(dateTimeM);
                                          print(dateTimeM);
                                        }
                                      })
                      ],
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "HORAS TOTAIS",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.015,
                                    color: Colors.white),
                              )),
                          Observer(builder: (_) {
                            return Container(
                                padding: EdgeInsets.only(left: 5),
                                child: controller.isDia
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
                                        controller.horasTrabalhadasMes(),
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
                            "SALDOS",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Observer(builder: (_) {
                if (controller.isDia) {
                  if (controller.pontosDia.length > 0) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      height: MediaQuery.of(context).size.height * 0.528,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          itemCount: controller.pontosDia.length,
                          itemBuilder: (context, index) {
                            DateTime saida;
                            DateTime entrada = DateTime.parse(
                                controller.pontosDia[index].entrada);
                            print(entrada);
                            controller.pontosDia[index].fim
                                ? saida = DateTime.parse(
                                    controller.pontosDia[index].saida)
                                : saida = DateTime.now();

                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 0,
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
                                              StringUtil.convertTime(entrada),
                                          style:
                                              TextStyle(color: Colors.orange),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      controller.pontosDia[index].fim
                                          ? Container(
                                              child: Text(
                                                "Saída: " +
                                                    StringUtil.convertTime(
                                                        saida),
                                                style: TextStyle(
                                                    color: Colors.orange),
                                                textAlign: TextAlign.start,
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Saída:",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                                textAlign: TextAlign.start,
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
                            );
                          }),
                    );
                  } else {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.528,
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
                            Text("Não há pontos cadastrados nessa data"),
                          ],
                        ));
                  }
                } else {
                  if (controller.pontosMes.length > 0) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      height: MediaQuery.of(context).size.height * 0.528,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          itemCount: controller.pontosMes.length,
                          itemBuilder: (context, index) {
                            DateTime saida;
                            DateTime entrada = DateTime.parse(
                                controller.pontosMes[index].entrada);
                            print(entrada);
                            controller.pontosMes[index].fim
                                ? saida = DateTime.parse(
                                    controller.pontosMes[index].saida)
                                : saida = DateTime.now();

                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 0,
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
                                              StringUtil.convertTime(entrada),
                                          style:
                                              TextStyle(color: Colors.orange),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      controller.pontosMes[index].fim
                                          ? Container(
                                              child: Text(
                                                "Saída: " +
                                                    StringUtil.convertTime(
                                                        saida),
                                                style: TextStyle(
                                                    color: Colors.orange),
                                                textAlign: TextAlign.start,
                                              ),
                                            )
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Saída:",
                                                style: TextStyle(
                                                    color: Colors.orange),
                                                textAlign: TextAlign.start,
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
                            );
                          }),
                    );
                  } else {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.528,
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
                            Text("Não há pontos cadastrados nessa data"),
                          ],
                        ));
                  }
                }
              })),
        ]),
      ),
    );
  }
}
