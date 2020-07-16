import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/data/data_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
part 'ponto_controller.g.dart';

class PontoController = _PontoControllerBase with _$PontoController;

abstract class _PontoControllerBase with Store {
  Completer<GoogleMapController> controllerMap = Completer();
  Completer<GoogleMapController> controllerMapVisita = Completer();
  @observable
  double distance = 0;
  @observable
  bool isVisita = false;
  @observable
  String intervalo = "Intervalo";
  @observable
  String cliente;
  @observable
  String descricao;

  @action
  setIsVisita(bool b) => isVisita = b;
  @action
  setIntervalo(String s) => intervalo = s;

  @action
  setCliente(String s) => cliente = s;

  @action
  setDescricao(String s) => cliente = s;

  var location = new Location();
  @observable
  Marker marker;
  @observable
  Circle circle;

  bool sucess;

  LocationData userLocation;

  Future<Uint8List> getMarker(BuildContext context) async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/circle.png");
    return byteData.buffer.asUint8List();
  }

  Future<void> initializeLocation(BuildContext context) async {
    userLocation = await location.getLocation();
    updateMarkerandCircle();
    controllerMap.future.then((value) {
      value.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
          target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 16.00)));
    });
    distance = await Geolocator().distanceBetween(userLocation.latitude,
        userLocation.longitude, -24.7841366, -49.9969496);
    print("Sua distância para a empresa é:" + distance.toString());
  }

  Future<void> initializeLocationVisita(BuildContext context) async {
    userLocation = await location.getLocation();
    updateMarkerandCircle();
    controllerMapVisita.future.then((value) {
      value.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
          target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 16.00)));
    });
  }

  static final CameraPosition _kCity = CameraPosition(
    target: LatLng(-24.8055, -49.9982), //loc Castro
    zoom: 12,
  );

  updateMarkerandCircle() {
    marker = Marker(
      markerId: MarkerId("userLocation"),
      position: LatLng(userLocation.latitude, userLocation.longitude),
      draggable: false,
      zIndex: 2,
      flat: true,
      anchor: Offset(0.5, 0.5),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    circle = Circle(
        circleId: CircleId('userCircle'),
        radius: 200,
        zIndex: 1,
        strokeColor: Colors.blue,
        strokeWidth: 2,
        center: LatLng(userLocation.latitude, userLocation.longitude),
        fillColor: Colors.blue.withAlpha(70));
  }

  @computed
  bool get distanciaEmpresa {
    if (distance > 100000) {
      return false;
    } else {
      return true;
    }
  }
}
