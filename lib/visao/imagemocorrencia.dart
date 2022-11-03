import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Imagem extends StatefulWidget {
  Imagem({Key? key}) : super(key: key);

  @override
  _Imagem createState() => _Imagem();
}

class _Imagem extends State<Imagem> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;

  @override
  void initSate() {
    super.initState();
    loadImages();
  }

  //puchando os dados do firebase store nome da imagem, imagem etc...
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        //esse como comentario e para puchar todas as imagens do bd mais demora muito
        loading
            ? const Center (
          child: CircularProgressIndicator(),
            )
            :

        Padding(
          padding: const EdgeInsets.all(24),
          child: arquivos.isEmpty
              ? const Center(
            child: Text('nao ha imagens'),
          )
              : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 40,
                  child: Image.network(
                    arquivos[index],
                    fit: BoxFit.cover,
                  ),
                ),

                //pegando o nome da imagem no firebase
                title: Text(refs[index].fullPath),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteImage(index),
                ),


              );
            },
            itemCount: arquivos.length,
          ),
        ));
  }

  deleteImage(int index) async{
    await storage.ref(refs[index].fullPath).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {

    });
  }



/*
  pegarImagemCamera() async{
    XFile? file = await getImage();
    if(file != null){
      await upload(file.path);
    }

  }

*/

}
