import 'package:flutter/material.dart';
import 'package:curriculoapp/interface/Home.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => Home()
        );
    }

  }

}