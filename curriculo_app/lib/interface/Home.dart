import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),

            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Curriculo Online"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: RaisedButton(
                child: Text ("Entrar"),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
