
import 'package:economiza2/visao/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {

  @override
  SobreState createState() => SobreState();
}

class SobreState extends State<Sobre> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,


        appBar: AppBar(
          actions: [

            IconButton(
              onPressed: () {
                voltar();
              },
              icon: Icon(Icons.arrow_back),
            ),
            // Text('${total.round()}% enviado')
          ],


          title: const Text('Sobre App'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.black38,
            ),
          ),

        ),

        body: SafeArea(

          child: SizedBox(

            width: double.infinity,
            height: 750,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [

                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Text(
                      'Este App foi desenvolvido por Francisco Augusto Neves Moreira Souza, juntamente com seu orientador Fernando Lima Paim para o trabalho de conclusao de curso(TCC). \n\n O principal objetivo e a redução do desperdicio de agua na cidade e a concientização da população de Formiga-MG',
                      style: TextStyle(fontSize: 27, color: Colors.white,),
                    )
                ),


              ],
            ),
          ),
        ));
  }
  voltar() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(),
    ),

    );


  }
}
