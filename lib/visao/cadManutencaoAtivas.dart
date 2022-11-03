import 'package:economiza2/controle/CTipoManutencao.dart';
import 'package:economiza2/modelo/beans/tipoManutencao.dart';
import 'package:economiza2/visao/cadIniciarManutencao.dart';

import 'package:economiza2/modelo/beans/tipoIniciarOcorrencia.dart';
import 'package:economiza2/visao/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadManutencaoAtivas extends StatefulWidget {
  @override
  _CadManutencaoAtivasState createState() => _CadManutencaoAtivasState();
}

class _CadManutencaoAtivasState extends State<CadManutencaoAtivas> {
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
              child: ListView(children: _listViewTipoManutencao),
            ),
          ),
        ],
      ),
    );
  }

  List<TipoManutencao> _tiposManutencao = [];

  //listView de tipos de gastos
  List<Widget> _listViewTipoManutencao = [];

  /**
   * Método responsável por construir o listview
   */
  _setListView() async {
    //busca lista de objetos Gasto do BD
    _tiposManutencao = await CTipoManutencao().getAllList();

    //monta listView já na treade de visualização de forma dinâmica
    setState(() {
      try {
        _listViewTipoManutencao = _tiposManutencao
            .map(
              (_data) => Card(
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

                              Text(_data.endereco.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(_data.numero.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(_data.bairro.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(_data.descricao.toString(),
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
                              _deleteTipoManutencao(_data.id!);
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0)),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            color: Colors.red,
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

  _deleteTipoManutencao(int id) {
    CTipoManutencao().deletar(id);
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
