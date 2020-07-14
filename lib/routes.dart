import 'package:flutter/material.dart';
import 'package:flutter_mobile/controller/perfil_controller.dart';
import 'package:flutter_mobile/ui/falta/justificar_falta_screen.dart';
import 'package:flutter_mobile/ui/hora_extra/pedido_hora_extra_screen.dart';
import 'package:flutter_mobile/ui/jornada/feriados_screen.dart';
import 'package:flutter_mobile/ui/jornada/jornada_trabalho_screen.dart';
import 'package:flutter_mobile/ui/login/pin_code_screen.dart';
import 'package:flutter_mobile/ui/perfil/perfil_screen.dart';
import 'package:flutter_mobile/ui/ponto/home_screen.dart';
import 'package:flutter_mobile/ui/ponto/ponto_screen.dart';
import 'package:flutter_mobile/ui/ponto/visita_screen.dart';
import 'package:flutter_mobile/ui/splash/splash_screen.dart';
import 'package:flutter_mobile/ui/tabs/tabbar_screen.dart';
import 'package:flutter_mobile/util/app_localizations.dart';
import './ui/sinc/sincronizacao_screen.dart';

import 'ui/login/login_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String pin = "/pin";
  static const String tabBar = '/tabBar';
  static const String perfil = '/perfil';
  static const String jornada = '/jornada';
  static const String horaExtra = '/horaExtra';
  static const String feriados = '/feriados';
  static const String sincronizar = '/sincronizar';
  static const String falta = '/falta';
  static const String ponto = '/ponto';
  static const String visita = "/visita";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        //var argument = setting.arguments as (tipo);
        // return MaterialPageRoute(builder: (context) => LoginScreen(nome_var: argument));
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case pin:
        return MaterialPageRoute(builder: (context) => PinCodeScreen());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case tabBar:
        return MaterialPageRoute(builder: (context) => TabBarScreen());
      case perfil:
        return MaterialPageRoute(builder: (context) => PerfilScreen());
      case jornada:
        return MaterialPageRoute(builder: (context) => JornadaTrabalhoScreen());
      case horaExtra:
        return MaterialPageRoute(builder: (context) => PedidoHoraExtraScreen());
      case feriados:
        return MaterialPageRoute(builder: (context) => FeriadosScreen());
      case sincronizar:
        return MaterialPageRoute(builder: (context) => SincronizacaoScreen());
      case falta:
        return MaterialPageRoute(builder: (context) => JustificarFaltaScreen());
      case ponto:
        var argument = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => PontoScreen(
                  ponto: argument["ponto"],
                ));
      case visita:
        return MaterialPageRoute(builder: (context) => VisitaScreen());
      // case home:
      //   return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(AppLocalizations.of(context).translate('path_error') +
                  ' ${settings.name}'),
            ),
          ),
        );
    }
  }
}
