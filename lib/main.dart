import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile/routes.dart';
import 'package:get_it/get_it.dart';

import 'controller/login_controller.dart';
import 'navigation_service.dart';
import 'util/app_localizations.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<NavigationService>(NavigationService());

  /* 
   * Ir registrando as instancias abaixo os stores
   * getIt.registerSingleton<Classe>(Classe());
   * Para recuperar a instancia do store nas classes, utilizar dentro do método build da seguinte forma
   * final store = GetIt.I.get<Classe>();
   * 
  */ 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boilerplate',
      theme: ThemeData(),
      // debugShowCheckedModeBanner: false,
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute,
      supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Verifica se o dispositivo tem suporte dos idiomas
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // Caso não existe, usa o primeiro, preferencialmente inglês
        return supportedLocales.first;
      },
    );
  }
}
