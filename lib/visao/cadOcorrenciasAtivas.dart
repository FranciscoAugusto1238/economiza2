import 'package:economiza2/visao/cadIniciarOcorrencia.dart';

import 'package:economiza2/controle/CTipoIniciarOcorrencia.dart';
import 'package:economiza2/modelo/beans/tipoIniciarOcorrencia.dart';
import 'package:economiza2/visao/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadOcorrenciasAtivas extends StatefulWidget {
  @override
  _CadOcorrenciasAtivasState createState() => _CadOcorrenciasAtivasState();
}

class _CadOcorrenciasAtivasState extends State<CadOcorrenciasAtivas> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,


      body: Column(
        children: <Widget>[
          //card para inserção

          Divider(
            height: 10,
          ),

          Expanded(
            child: Card(
              child: ListView(children: _listViewTipoOcorrencia),
            ),
          ),
        ],
      ),
    );
  }

  List<TipoIniciarOcorrencia> _tiposOcorrencias = [];

  //listView de tipos de gastos
  List<Widget> _listViewTipoOcorrencia = [];

  /**
   * Método responsável por construir o listview
   */
  _setListView() async {
    //busca lista de objetos Gasto do BD
    _tiposOcorrencias = await CTipoIniciarOcorrencia().getAllList();

    //monta listView já na treade de visualização de forma dinâmica
    setState(() {
      try {
        _listViewTipoOcorrencia = _tiposOcorrencias
            .map(
              (_data) => Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  elevation: 4,

                  child: Container(
                    height: 100,
                    width: 57,

                    color: Colors.white,
                    child: Row(

                      children: <Widget>[

                        Expanded(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[

                              Text(
                                _data.endereco.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                _data.numero.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                _data.bairro.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                _data.descricao.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        ButtonTheme(
                          height: 40.0,


                           child: RaisedButton(
                            onPressed: () {
                              _deleteTipoIniciarOcorrencia(_data.id!);
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0)),
                            child: Icon(

                              Icons.remove,
                              color: Colors.white,
                            ),
                            color: Colors.red,
                             padding: const EdgeInsets.symmetric(horizontal: 15),


                           ),


                        )
                      ],
                    ),
                  )),
            )
            .toList();
      } catch (_) {
        print("Não foi possível iniciar ocorrencia!!!");
        /*Toast.show("Não foi possível adicionar ao carrinho!", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);*/
      }
    });
  }

  _deleteTipoIniciarOcorrencia(int id) {
    CTipoIniciarOcorrencia().deletar(id);
    setState(() {
      _setListView();
    });
  }

  /**
   * Método usado para inicialiar objetos e elementos ao criar a tela
   */
  @override
  void initState() {
    super.initState();

    //gera a listagem de elementos na thread de visão(de forma dinâmica)
    setState(() {
      _setListView();
    });
  }
}
