import 'dart:async';

import 'package:economiza2/visao/menu.dart';
import 'package:economiza2/visao/navegar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:economiza2/visao/home_page.dart';
import 'package:economiza2/login_page.dart';



class ChecagemPage extends StatefulWidget {
  const ChecagemPage({Key? key}) : super(key: key);

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {

StreamSubscription? streamSubscription;





 @override
void initState() {
    // TODO: implement initState
    super.initState();
   streamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> LoginPage(),
          ),
        );

        print('Voce nao tem usuario logado!');
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>  Navegar2(0),
        ),
        );
        print('Voce esta logado!');
      }
    });
  }
@override
void dispose(){
   streamSubscription!.cancel();
   super.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(

        child:  CircularProgressIndicator(),

      ),

    );
  }
}














