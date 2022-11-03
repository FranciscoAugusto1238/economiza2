
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:economiza2/visao/cadIniciarOcorrencia.dart';

import '../modelo/beans/tipoIniciarOcorrencia.dart';

class Relatorios extends StatefulWidget {

  @override
  _RelatoriosState createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
//late int contador;


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Relatorio'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.black38,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[

            Card(
              color: Colors.blue,
                child: Text(
                  "Numero de Ocorrencias:",
                 // "Enviar $contador ",
                  style: TextStyle(color: Colors.white, fontSize: 25),

                ),
            ),

                Divider(),
                Card(
                  color: Colors.blue,
                  child: Text(
                    "Numero de Manutenção:",
                    // "Enviar $contador ",
                    style: TextStyle(color: Colors.white, fontSize: 25),

                  ),
                ),

              ],
            ),
          ),
        )


    );
  }
}