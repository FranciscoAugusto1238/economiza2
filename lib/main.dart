import 'package:economiza2/visao/menu.dart';
import 'package:economiza2/visao/navegar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:economiza2/checagem_page.dart';
import 'visao/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

/*
  FirebaseFirestore.instance.collection('contact').doc().set({
    'name':'Joaquin',
    'phone': '(37)99875-0927',
    'e-mail':'franciscoau1238@gmail.com'
  });
*/

  var collection = FirebaseFirestore.instance.collection('contact');
// antes tava assim
// collection.doc('contato3').set({
  collection.doc().set({
    'name':'Osvaldo',
    'phone': '(37)99875-0927',
    'e-mail':'franciscoau1238@gmail.com'



  }
  ).then((value) => print('Deu certo')).catchError((erro)=> print('deu errado $erro'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase app',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:  Navegar2(0),
      debugShowCheckedModeBanner: false,

    );
  }
}
