import 'package:economiza2/splash.dart';
import 'package:economiza2/visao/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cadastro_page.dart';
import 'visao/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();
 final _firebaseAuth = FirebaseAuth.instance;



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black38,
          ),
        ),
      ),



      body: ListView(
        padding: EdgeInsets.all(12),
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/formiga.jpg', width: 300, height: 200),
            ],
          ),
          Text("Economiza Formiga",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 35)),




          TextFormField(
            autofocus: false,

            controller: _emailController,
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.email,color: Colors.white),
),
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.password, color: Colors.white),
            ),
          ),
          ElevatedButton(onPressed: (){

            login();
          },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
            child: Text('Entrar'),
          ),

         TextButton(
           onPressed: (){
             Navigator.push(
               context,
                // MaterialPageRoute(builder: (context) => Navegar(0),
               MaterialPageRoute(builder: (Context)=> CadastroPage(),
             ),
             );

           },
           child: Text('Criar Conta',
             style: TextStyle(
               color: Colors.white,
               fontSize: 15,
             ),
           ),
         ),
        ],
      ),

    );
  }

  login() async{
try{
 UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
    email: _emailController.text,
    password: _passwordController.text
);

 if(userCredential != null){
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(
       // MaterialPageRoute(builder: (context) => Navegar(0),
       builder:  (context) => Splash(),
     ),
   );
   print('Bem vindo!');

 }

}on FirebaseAuthException catch (e){
if(e.code == 'user-not-found'){
  ScaffoldMessenger.of(context).showSnackBar(
   const SnackBar(
     content: Text('Usuario não encontrado'),
   backgroundColor:  Colors.red,

   ),
    
  );
  print('Usuario não encontrado');
}else if(e.code == 'wrong-password'){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Sua senha esta errada'),
      backgroundColor:  Colors.red,

    ),
  );
  print('Sua senha esta errada');
  }


}

  }



}
