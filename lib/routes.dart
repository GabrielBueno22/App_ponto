import 'package:flutter/material.dart';
import 'package:flutter_mobile/util/app_localizations.dart';

import 'ui/login/login_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
      //var argument = setting.arguments as (tipo);
      // return MaterialPageRoute(builder: (context) => LoginScreen(nome_var: argument));
        return MaterialPageRoute(builder: (context) => LoginScreen());
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
