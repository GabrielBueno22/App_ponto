import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  _SplashScreenState() {
    //changeScreen();
    Future.delayed(const Duration(seconds: 2), () {})
        .then((value) => navigator.navigateTo("/pin"));
    print("Going to pin");
  }
  @override
  void initState() {
    super.initState();
    //changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFff4301),
              const Color(0xFFfa7d09)
            ], // whitish to gray
            tileMode: TileMode.repeated // repeats the gradient over the canvas
            ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.watch_later,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "ON SUITE",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                color: Colors.white),
          )
        ],
      ),
    ));
  }

  Future<void> changeScreen() async {
    //if(Login){

    //}
    //else{

    //}
  }
}
