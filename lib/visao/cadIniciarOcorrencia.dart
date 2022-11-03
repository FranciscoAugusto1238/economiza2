import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../controle/CTipoIniciarOcorrencia.dart';
import '../modelo/beans/tipoIniciarOcorrencia.dart';
import 'cadOcorrenciasAtivas.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'imagemocorrencia.dart';


class CadIniciarOcorrencia extends StatefulWidget {
  @override
  _CadIniciarOcorrenciaState createState() => _CadIniciarOcorrenciaState();
}

class _CadIniciarOcorrenciaState extends State<CadIniciarOcorrencia> {
  /*
  final _tecEndereco = TextEditingController();
  final _tecNumero = TextEditingController();
  final _tecBairro = TextEditingController();
  final _tecDescricao = TextEditingController();
  */

  //final _firebaseAuth2 = FirebaseAuth.instance;
  //========================================
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  bool _isDisabled = false;
  String _distancia = "";

  @override
  void initSate() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    refs = (await storage.ref('ocorrencia').listAll()).items;
    for (var ref in refs) {
      //ter acesso a imagem que fizemos o upload
      arquivos.add(await ref.getDownloadURL());
    }
    setState(() {
      loading = false;
    });
  }

  Future<XFile?> getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'ocorrencia/img-${DateTime.now().toString()}.jpg';
      return storage.ref(ref).putFile(file);
      throw Exception('sucesso no upload ');
    } on FirebaseException catch (e) {
      throw Exception('erro no upload  ${e.code}');
    }
  }

  deleteImage(int index) async{
    await storage.ref(refs[index].fullPath).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {

    });
  }
  pegarImagemGaleria() async {
    XFile? file = await getImage();
    if (file != null) {
      UploadTask task = await upload(file.path);
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {

          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(snapshot.ref);

          setState(() => uploading = false);
        }
      });
    }
  }
//========================================
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void calculaDistancia() async {
    //só inicio ela com -1 para deixar a espera circular na montagem da tela
    setState(() {
      _distancia = "";
    });

    //pega a ultima posição conhecida pelo gps do aparelho
    Position? position = await _determinePosition();

    //uso o setstate para alterar o estado visual da aplicação
    setState(() {
      //calculando em kilometros
      _distancia = "${position.latitude} + ${position.longitude}";
    });
  }

  //========================================
  int contador = 0;

  void somarconta(int valor) {
    setState(() {
      // contador += valor;
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: Column(

        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/formiga.jpg', width: 300, height: 200),
            ],
          ),
          //card para inserção
          Card(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      TextField(
                        enabled: !_isDisabled,
                        controller: _tecEndereco,
                        decoration: const InputDecoration(
                          labelText: 'Endereço',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SwitchListTile(
                        value: _isDisabled,
                        onChanged: (value) {
                          calculaDistancia;
                          setState(() {
                            calculaDistancia;
                            _isDisabled = value;
                            _tecEndereco == _distancia;
                          });
                        },
                        title: const Text('Usar localização Atual ?',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _tecNumero,
                        decoration: const InputDecoration(
                          labelText: 'Numero',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _tecBairro,
                        decoration: const InputDecoration(
                          labelText: 'Bairro',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _tecDescricao,
                        decoration: const InputDecoration(
                          labelText: 'Descrição',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),




          Text(
            "Anexe a imagem da Denuncia!\n",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              RaisedButton(
                onPressed: () {
                  pegarImagemGaleria();

                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
                child:
                IconButton(
                  onPressed: () {
                    pegarImagemGaleria();
                  },
                  icon: Icon(Icons.file_upload, color: Colors.white),
                ),
                color: Colors.grey,

              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                onPressed: () {
                  // ocorrencia();
                  _insereTipoIniciarOcorrencia();
                  _insereTipoOcorrenciafire();

                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
                child: Text(
                  "Enviar ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //controllers dos texts fields

  TextEditingController _tecEndereco = TextEditingController();
  TextEditingController _tecNumero = TextEditingController();
  TextEditingController _tecBairro = TextEditingController();
  TextEditingController _tecDescricao = TextEditingController();




  //lista de tipo de gastos
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
              (_data) => Card(),
            )
            .toList();
      } catch (_) {
        print("Não foi possível iniciar ocorrencia!!!");
        /*Toast.show("Não foi possível adicionar ao carrinho!", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);*/
      }
    });
  }

  Future _insereTipoOcorrenciafire() async {

    final docUser = FirebaseFirestore.instance.collection('Ocorrencia').doc();
    final endereco= _tecEndereco.text;
    final numero= _tecNumero.text;
    final bairro= _tecBairro.text;
    final descricao= _tecDescricao.text;

    final json = {
      'Endereço': endereco,
      'Numero': numero,
      'Bairro': bairro,
      'Descricao': descricao,

    };

    //criando documento no firebase
    await docUser.set(json);
  }
  _insereTipoIniciarOcorrencia() {
    TipoIniciarOcorrencia g = TipoIniciarOcorrencia(null,'Endereço: '+ _tecEndereco.text, 'Numero: '+_tecNumero.text, 'Bairro: '+_tecBairro.text,'Descrição: '+ _tecDescricao.text);
    CTipoIniciarOcorrencia().insert(g);

    setState(() {
      _setListView();
    });
  }

  /**
   * Método usado para inicialiar objetos e elementos ao criar a tela
   */

}
