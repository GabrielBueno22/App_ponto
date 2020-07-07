import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/splash_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = GetIt.I.get<SplashController>();
  final navigator = GetIt.I.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
