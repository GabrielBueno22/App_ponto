import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobile/controller/ponto_controller.dart';
import 'package:flutter_mobile/data/data_manager.dart';
import 'package:flutter_mobile/data/model/Ponto.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobile/ui/widgets/text_form_selector.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PontoScreen extends StatefulWidget {
  final Ponto ponto;

  const PontoScreen({Key key, this.ponto}) : super(key: key);
  @override
  _PontoScreenState createState() => _PontoScreenState();
}

enum ALertState { IDLE, LOADING, SUCCESS, FAIL }

class _PontoScreenState extends State<PontoScreen> {
  final controller = GetIt.I.get<PontoController>();
  final navigator = GetIt.I.get<NavigationService>();
  bool location = true;

  @override
  void initState() {
    controller.circle = null;
    controller.controllerMap = Completer();
    controller.location = Location();
    controller.userLocation = null;
    controller.marker = null;
    controller.initializeLocation(context).then((value) => locationC());
    super.initState();
  }

  Future<void> locationC() async {
    location = await controller.compareLocation();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-24.8055, -49.9982),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    controller.initializeLocation(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ponto"),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Observer(builder: (_) {
          return GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            markers:
                Set.of((controller.marker != null) ? [controller.marker] : []),
            circles:
                Set.of((controller.circle != null) ? [controller.circle] : []),
            onMapCreated: (GoogleMapController mpcontroller) {
              controller.controllerMap.complete(mpcontroller);
            },
          );
        }),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.81,
          right: MediaQuery.of(context).size.width * 0.25,
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: const Color(0xFFfa7d09)),
            child: FlatButton(
                onPressed: () {
                  locationC();
                  widget.ponto.id == null
                      ? showAlertDialog(context)
                      : showDialogSucces(context);
                },
                child: widget.ponto.id == null
                    ? Text(
                        "Entrada",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text("Saída", style: TextStyle(color: Colors.white))),
          ),
        )
      ]),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.deepOrange),
        child: IconButton(
          onPressed: () {
            controller.initializeLocation(context);
            print(controller.userLocation);
          },
          icon: Icon(
            Icons.location_searching,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  showAlertDialog(BuildContext context) async {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuaButton = FlatButton(
      child: Text("Continuar"),
      onPressed: () {
        DataManager.instance
            .insertPonto(Ponto(
                id: null,
                id_funcionario: 1,
                entrada: DateTime.now().toIso8601String(),
                saida: null,
                fim: false))
            .then((value) {
          if (value is int) {
            print(value);
            navigator.navigateTo("/tabBar");
          } else {}
        });
      },
    );
    //configura o AlertDialog
    AlertDialog alert = location
        ? AlertDialog(
            title: Text("Ponto"),
            content: Text("Deseja registrar sua entrada?"),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              cancelaButton,
              continuaButton,
            ],
            backgroundColor: Colors.white,
          )
        : AlertDialog(
            title: Text("Erro"),
            content: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Text(
                        "Voce precisa estar próximo à empresa para bater o ponto. Tente novamente mais tarde"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                )),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              cancelaButton,
            ],
            backgroundColor: Colors.white,
          );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showDialogSucces(BuildContext context) async {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuaButton = FlatButton(
      child: Text("Continuar"),
      onPressed: () {
        Ponto p = widget.ponto;
        p.saida = DateTime.now().toIso8601String();
        p.fim = true;
        DataManager.instance.updatePonto(p).then((value) {
          if (value is int) {
            print(value);
            navigator.navigateTo("/tabBar");
          } else {}
        });
      },
    );
    //configura o AlertDialog
    String motivo;
    AlertDialog alert = location
        ? AlertDialog(
            title: Text("Ponto"),
            content: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  children: <Widget>[
                    Text("Deseja registrar sua saída?"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormSelector(
                      selections: [
                        "Almoço",
                        "Jantar",
                        "Intervalo",
                        "Fim de Expediente"
                      ],
                      onChanged: (value) {
                        motivo = value;
                      },
                      text: "Motivo da saída",
                      initialValue: "Almoço",
                      enabled: true,
                    )
                  ],
                )),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              cancelaButton,
              continuaButton,
            ],
            backgroundColor: Colors.white,
          )
        : AlertDialog(
            title: Text("Erro"),
            content: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Text(
                        "Voce precisa estar próximo à empresa para bater o ponto. Tente novamente mais tarde"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                )),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            actions: [
              cancelaButton,
            ],
            backgroundColor: Colors.white,
          );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showDialogArea() {}
}
