
import 'dart:io';
import 'dart:ui';
import 'package:economiza2/visao/cadIniciarManutencao.dart';
import 'package:economiza2/visao/cadIniciarOcorrencia.dart';
import 'package:economiza2/visao/cadManutencaoAtivas.dart';
import 'package:economiza2/visao/cadOcorrenciasAtivas.dart';
import 'package:economiza2/visao/dicas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../checagem_page.dart';
import 'home_page.dart';

//indice de seleção da tela pelo menuBottomNavigation
int _selectedIndex = 0;
//vetor de telas a serem utilizadas como escolhas do menuBottomNavigation
List<Widget> _stOptions = <Widget>[
  HomePage(),
  CadIniciarOcorrencia(),
  CadIniciarManuencao(),
  CadOcorrenciasAtivas(),
  CadManutencaoAtivas(),
  Dicas(),
];

class Navegar2 extends StatefulWidget {
  final _opcao;

  //contrutor passando o indice da tela selecionada
  Navegar2(this._opcao);

  @override
  _Navegar2State createState() => _Navegar2State(this._opcao);
}

class _Navegar2State extends State<Navegar2> {
  final _firebaseAuth = FirebaseAuth.instance;
  String nome = '';
  String email ='';
   //construtor
  _Navegar2State(this._opcao);

  //indice de seleção da tela pelo menuBottomNavigation
  int _opcao;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _opcao;
    pegarUsuario();

  }

  /// * Método que força a tela ser "Retrato"
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  ///* Método do evento de click do BN
  //@override
  void _onItemTapped(int  index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// * Método chamado no momento em que o usuário deseja sair da aplicação,
  /// * ele gera um Dialog perguntando se realmente é isso que o usuário deseja

  Future<bool> _onSair() {
    Future<bool?> resp = showDialog<bool>(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Fechar App?'),
        content: new Text('Deseja sair do App?'),
        actions: <Widget>[
          new TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Não'),
          ),
          new TextButton(
            onPressed: () {
              exit(0);
            },
            child: new Text('Sim'),
          ),
        ],
      ),
    );
    if (resp ==null || resp == false){
     return retorno(false);
    }else{
      return retorno(true);
    }
  }
  //função para retorno true ou false de auxilio
  Future<bool>retorno(bool x) async{
    if (x){
      return true;
    }else
      return false;
  }

  //InAppWebViewController _webViewRadio; //webview da rádio no BN
  //bool _isLoadingPage = true; //flag que indica se a webview está carregado
  double progress = 0; //flag que indiga a porcentagem de carregamento da webview


  /// * Método de construção de componentes da tela de BN,
  /// * esta tela ecapsula demais telas exibidas pelas opções do BN
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return WillPopScope(
        //uso esta widguet para fazer a verificação de saída da aplicação
        onWillPop: _onSair,
        child: Scaffold(
          appBar: AppBar(
            title: Center(),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              // botão de saida da aplicação
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  _onSair();
                },
              ),
            ],
          ),

          //corpo da aplicação, aqui são setadas as telas
          body: _stOptions.elementAt(
            _selectedIndex,
          ),

          bottomSheet: Container(
            color: Colors.greenAccent,
            height: 1,
          ),

          //aqui é construido o NavigationDrawer
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                //cabeçalho do NavDrawer
                UserAccountsDrawerHeader(
                  accountName: Text(nome),
                  accountEmail: Text(email),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    gradient: LinearGradient(
                        colors: [Color(0xff4269ba), Colors.black38]),
                  ),
                  currentAccountPicture: /*Image.asset(
                    "imgs/logo.png",
                  ),*/
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://www.ifmg.edu.br/portal/imagens/logovertical.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  arrowColor: Colors.blue,

                ),
                //lista de opções do NavDrawer
                ListTile(
                    leading: Icon(Icons.house),
                    title: Text("Home Page"),
                    subtitle: Text("Pagina Inicial"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Navegar2(0)));
                    }),
                ListTile(
                    leading: Icon(Icons.wb_twighlight, color: Colors.red),
                    title: Text("Iniciar Denuncia"),
                    subtitle: Text("Denuncia de desperdicio"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Navegar2(1)));
                    }),
                ListTile(
                    leading: Icon(Icons.warning_sharp, color: Colors.yellow),
                    title: Text("Iniciar Manutenção"),
                    subtitle: Text("Solicitar pedido de manutenção"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navegar2(2)));
                      //Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.playlist_add_check_outlined, color: Colors.green),
                    title: Text("Historico de Denuncia"),
                    subtitle: Text("Informações ocorrencias ja realizadas"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Navegar2(3)));
                      //Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.app_registration, color: Colors.teal),
                    title: Text("Historico de Manutenção"),
                    subtitle: Text("Informações sobre manutenção ja realizadas"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Navegar2(4)));
                      //Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.live_help_rounded, color: Colors.deepOrange),
                    title: Text("Dicas"),
                    subtitle: Text("Dicas para economia de agua"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Navegar2(5)));
                      //Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Sair da conta"),
                    subtitle: Text("Sair da conta"),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                      sair();
                    }),
              ],
            ),
          ),


        ));
  }

  sair() async{
    await _firebaseAuth.signOut().then((user) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChecagemPage(),
        ),
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
}
