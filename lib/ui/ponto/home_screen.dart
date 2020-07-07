import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/controller/home_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = GetIt.I.get<HomeController>();
  final navigator = GetIt.I.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
