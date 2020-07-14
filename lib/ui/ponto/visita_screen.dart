import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/ponto_controller.dart';
import 'package:flutter_mobile/controller/visita_controller.dart';
import 'package:flutter_mobile/data/data_manager.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:flutter_mobile/ui/widgets/text_form.dart';
import 'package:flutter_mobile/ui/widgets/text_form_selector.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class VisitaScreen extends StatefulWidget {
  @override
  _VisitaScreenState createState() => _VisitaScreenState();
}

class _VisitaScreenState extends State<VisitaScreen> {
  final controller = GetIt.I.get<PontoController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  void initState() {
    controller.circle = null;
    controller.controllerMapVisita = Completer();
    controller.location = Location();
    controller.userLocation = null;
    controller.marker = null;
    controller.initializeLocation(context);
    super.initState();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-24.8055, -49.9982),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    controller.initializeLocationVisita(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Visita"),
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
              controller.controllerMapVisita.complete(mpcontroller);
            },
          );
        }),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.75,
          right: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: const Color(0xFFfa7d09)),
            child: FlatButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: Text(
                  "Cadastrar Visita",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        )
      ]),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.deepOrange),
        child: IconButton(
          onPressed: () {
            controller.initializeLocationVisita(context);
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

  showAlertDialog(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continuaButton = FlatButton(
        child: Text("Cadastrar"),
        onPressed: () {
          navigator.navigateTo("/tabBar");
        });
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Visita"),
      content: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: <Widget>[
              Text("Deseja registrar sua visita nesse endereço?"),
              WidgetTextForm(
                  value: "",
                  text: "Cliente",
                  icon: null,
                  onChanged: null,
                  enabled: true,
                  numero: false,
                  error: null),
              WidgetTextForm(
                  value: "",
                  text: "Motivo da visita",
                  icon: null,
                  onChanged: null,
                  enabled: true,
                  numero: false,
                  error: null),
            ],
          ),
        ),
      ),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        cancelaButton,
        continuaButton,
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
}
