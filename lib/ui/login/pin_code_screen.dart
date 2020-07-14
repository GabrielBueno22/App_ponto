import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/login_controller.dart';
import 'package:flutter_mobile/navigation_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_view/pin_code_view.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final controller = GetIt.I.get<LoginController>();
  final navigator = GetIt.I.get<NavigationService>();
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
              tileMode:
                  TileMode.repeated // repeats the gradient over the canvas
              ),
        ),
        child: PinCode(
          backgroundColor: Colors.transparent,
          title: Text(
            "Código de acesso do funcionário",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),

          subTitle: Text(
            "Insira seu código de acesso",
            style: TextStyle(color: Colors.white),
          ),
          codeLength: 4,
          // you may skip correctPin and plugin will give you pin as
          // call back of [onCodeFail] before it clears pin
          correctPin: "1234",
          onCodeSuccess: (code) {
            print(code);
            navigator.navigateTo('/tabBar');
          },
          onCodeFail: (code) {
            print(code);
          },
        ),
      ),
    );
  }
}
