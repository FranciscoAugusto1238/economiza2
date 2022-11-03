import 'package:economiza2/visao/menu.dart';
import 'package:economiza2/visao/sobre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:economiza2/checagem_page.dart';

import 'navegar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firebaseAuth = FirebaseAuth.instance;
String nome = '';
String email ='';
@override
initState() {
    // TODO: implement initState
    pegarUsuario();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/formiga.jpg', width: 300, height: 200),
            ],
          ),

        Text("Bem vindo ao Economiza Formiga: "+ nome+"\n",

          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25),
        ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [



              RaisedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Navegar2(1)),
                  ),
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: Text(
                  "Denuncia",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.red,
              ),
              SizedBox(width: 10,),
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Navegar2(2)),
                  ),
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                child: Text(
                  "Manutenção",
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

  pegarUsuario() async{
   User? usuario = await _firebaseAuth.currentUser;
if(usuario != null){
  setState(() {
    nome = usuario.displayName!;
    email = usuario.email!;
  });
}
  }









  sair() async{
 await _firebaseAuth.signOut().then((user) =>
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChecagemPage(),
 ),
 ),
 );


  }
  Ocorrencia() {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navegar(1),
        ),

    );


  }
  Manutencao() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navegar(2),
    ),

    );


  }
  Dica() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navegar(3),
    ),

    );


  }
  App() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Sobre(),
    ),

    );


  }







}
