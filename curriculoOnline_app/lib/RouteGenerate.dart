import 'package:flutter/material.dart';
import 'file:///C:/Users/dryka/AndroidStudioProjects/flutter_app/lib/telas/TelaCadastroCandidato.dart';
import 'file:///C:/Users/dryka/AndroidStudioProjects/flutter_app/lib/telas/TelaLogin.dart';

import 'package:flutter_app/telas/Home.dart';

class RouteGenarator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      case "/login":
        return MaterialPageRoute(
            builder: (_) => TelaLogin()
        );
      case "/cadastro":
        return MaterialPageRoute(
            builder: (_) => TelaCadastroCandidato()
        );

      }
  }

}