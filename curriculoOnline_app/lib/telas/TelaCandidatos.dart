
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/model/Usuario.dart';

import 'package:firebase_auth/firebase_auth.dart';

class TelaCandidatos extends StatefulWidget {
  @override
  _TelaCandidatosState createState() => _TelaCandidatosState();
}

class _TelaCandidatosState extends State<TelaCandidatos> {


  String _idUsuarioLogado;
  String _emailUsuarioLogado;


  Future<List<Usuario>> _recuperarUsuario() async {
    Firestore db = Firestore.instance;

    QuerySnapshot querySnapshot = await db.collection("usuario").getDocuments();

    List<Usuario> listaUsuarios = List();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;

      Usuario usuario = Usuario();
      usuario.nome = dados["nome"];
      usuario.telefone = dados["telefone"];
      usuario.email = dados["email"];
      usuario.senha = dados["senha"];
      usuario.habilidade = dados["habilidade"];
      usuario.resumoHabilidade = dados["resumoHabilidade"];
      usuario.curso = dados ["curso"];
      usuario.data = dados ["data"];
      usuario.instituicao = dados ["instituicao"];


      listaUsuarios.add(usuario);
    }
    return listaUsuarios;
  }

  _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;
    _emailUsuarioLogado = usuarioLogado.email;
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          decoration: BoxDecoration(color: Color(0xff1c1c1c)),
          padding: EdgeInsets.only(top: 15),
          child: FutureBuilder<List<Usuario>>(
            future: _recuperarUsuario(),
            //  ignore: missing_return
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Text("Carregando Usuarios"),
                          CircularProgressIndicator()
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, indice) {
                          List<Usuario> listaItens = snapshot.data;
                          Usuario usuario = listaItens[indice];
                          return Center(
                            child: Card(
                              color: Colors.amber,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    onTap: () {

                                    },
                                    contentPadding:
                                        EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    title: Text(usuario.nome,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.amber,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                    break;
                }
              })
      ),
    //)
    );
  }
}
