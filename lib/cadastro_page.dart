import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:economiza2/checagem_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cadastro'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black38,
          ),
        ),
      ),


      body:  ListView(

        padding: EdgeInsets.all(12),
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/formiga.jpg', width: 300, height: 200),
            ],
          ),
          TextFormField(

            controller: _nomeController ,
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: 'Nome',
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.web_outlined,color: Colors.white),
),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.email,color: Colors.white),
            ),
          ),
          TextFormField(
            controller:  _passwordController,
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.password_outlined,color: Colors.white),
            ),
          ),
          ElevatedButton(
              onPressed: (){

cadastrar();

              },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
              child: Text('Cadastrar'),
          ),


        ],
      ),
    );
  }

  cadastrar() async{

    try{
     UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
     if(userCredential != null){
       userCredential.user!.updateDisplayName(_nomeController.text);
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(
             builder:(context)=> ChecagemPage(),
           ),
           result: (route)=> false);
     }
    }on FirebaseAuthException catch(e){
     if(e.code == 'weak-password'){
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('Crie uma senha mais forte'),
           backgroundColor:  Colors.red,

         ),

       );
}else if(e.code == 'email-already-in-use'){
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('E-mail ja foi cadastrado'),
           backgroundColor:  Colors.red,

         ),

       );
     }
    }


  }



}
