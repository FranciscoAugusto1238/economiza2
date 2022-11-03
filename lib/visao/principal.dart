import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('images/formiga.jpg', width: 300, height: 200),
                  ],
                ),
                Text("Economiza Formiga-MG",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 50)),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
