import 'package:flutter/material.dart';
import 'package:curriculoapp/RouteGenarator.dart';
import 'package:curriculoapp/interface/Home.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
        primaryColor: Color(0xff1C1C1C),
        accentColor: Color(0xfff5a622)
    ),
  )
  );
}