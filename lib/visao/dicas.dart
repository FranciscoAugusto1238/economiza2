
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dicas extends StatefulWidget {

  @override
  DicasState createState() => DicasState();
}

class DicasState extends State<Dicas> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,

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
                    alignment: Alignment.center,
                    child:
                    Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('images/formiga.jpg', width: 300, height: 200),
                  ],
                ),
                 Text(
                  'Arraste para o lado para ver dicas sobre economia de agua \n\n'
                      '----------------------------->>>>>>',
                  style: TextStyle(fontSize: 30, color: Colors.white,),
                ),
                Divider(),
              ],
            ),
          ),
        )

                ),
                    Container(
                        margin: const EdgeInsets.all(15),
                        width: 400,
                        height: 300,
                        color: Colors.white10,

                         child:
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Center(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   '1. Cronometre o banho \n\n'
                                       'Um banho de 15 minutos pode gastar at??135 litros de ??gua. Se voc?? reduzir o tempo embaixo do chuveiro para 5 minutos, apenas 45 litros s??o utilizados. Portanto, o ideal ?? optar por banhos r??pidos, que durem o tempo necess??rio para fazer a higieniza????o do corpo. Al??m disso, para potencializar a economia, desligue o chuveiro ao lavar o cabelo e ao se ensaboar.',
                                   style: TextStyle(fontSize: 27, color: Colors.white,),
                                 ),
                                 Divider(),
                               ],
                             ),
                           ),
                         )

                    ),

                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '2. Desligue a torneira ao escovar os dentes \n\n '
                                  'As torneiras tamb??m s??o grandes respons??veis pelo desperd??cio. Escovar os dentes e lavar o rosto e as m??os com a torneira aberta pode representar um gasto de 12 litros de ??gua. Por isso, feche-as bem sempre que n??o estiver usando a ??gua.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )

                   ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '3. Ensaboe todas as lou??as de uma s?? vez \n\n '
                                  'Antes de lavar a lou??a, retire os restos de comida com o apoio de um guardanapo ou toalha de papel e ensaboe todas de uma s?? vez, com a torneira fechada. Depois, fa??a o enx??gue. Outra dica ?? lavar os utens??lios menos engordurados primeiro. Assim, a gordura n??o se espalha para os outros itens.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )

                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '4. Limite o uso da m??quina de lavar \n\n '
                                  'O ideal ?? usar a m??quina sempre cheia e em ciclos completos de lavagem. Para isso, acumule mais roupas para lavar tudo de uma vez. Alguns eletrodom??sticos mais modernos tamb??m oferecem um modo econ??mico, que gasta at?? 30% menos ??gua e energia.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )


                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const  Text(
                              '5. Reaproveite a ??gua da m??quina de lavar \n\n '
                                  'A ??gua utilizada na m??quina de lavar costuma ser descartada pelo ralo. No entanto, por conter apenas res??duos de sab??o, na maioria dos casos, ela pode ser reaproveitada e servir para lavar pisos, lavar o quintal e at?? regar plantas. Caso precise guardar essa ??gua por alguns dias, o ideal ?? utilizar um pouco de cloro para evitar a prolifera????o de micro-organismos que causam mau cheiro.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '6. N??o lave cal??adas com mangueira \n\n '
                                  'Lavar a cal??ada com mangueira ?? uma atitude pouco consciente e pode representar um gasto de 120 litros de ??gua. Em Fortaleza, por exemplo, existe multa para quem faz uso cont??nuo de ??gua nessa atividade. Portanto, prefira usar a vassoura para limpar o quintal e a cal??ada.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '7. Implemente a descarga com v??lvula de duplo acionamento \n\n '
                                  'Usar sempre a mesma quantidade de ??gua na descarga ?? desperd??cio. J?? existem sistemas desenvolvidos para liberar ??gua na bacia sanit??ria de acordo com a necessidade. A v??lvula de duplo acionamento pode ser instalada tanto em descargas de parede quanto em caixas acopladas.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                   ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '8. Verifique e corrija quaisquer vazamentos \n\n '
                                  'Infiltra????es e vazamentos podem acontecer sem que voc?? perceba e representar um elevado desperd??cio de ??gua ??? al??m de dar um susto na conta que chega no final do m??s. Goteiras e manchas na parede s??o ind??cios que aparecem quando problemas maiores j?? se instalaram h?? mais tempo. Outros sinais s??o mofo, pintura com bolhas, pintura com aspecto umedecido e bolor. Nesses casos, o ideal ?? buscar ajuda especializada.',
                              style: TextStyle(fontSize: 25, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                   ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,

                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '9. Feche bem as torneiras \n\n '
                                  'Torneira vazando ?? f??cil de perceber e pode desperdi??ar at?? 40 litros de ??gua por dia. Se perceber esse problema, ?? fundamental realizar a troca ou o conserto. Se a resolu????o for demorar alguns dias, n??o deixe de recolher a ??gua para que seja poss??vel reutiliz??-la. ',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                   ),
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 400,
                    height: 300,
                    color: Colors.white10,
                    //alignment: Alignment.center,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              '10. Lave o carro com baldes \n\n '
                                  'N??o use a mangueira para lavar o carro ??? opte por baldes, que evitam o desperd??cio. Outra forma de economizar ?? a ecolavagem, que deixa o ve??culo limpo e protegido com menos de um litro de ??gua. Basta ter dois panos de microfibra, um shampoo especial para lavagem e um borrifador com 400 ml de ??gua.',
                              style: TextStyle(fontSize: 27, color: Colors.white,),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                   ),

              ],
            ),
          ),
        ));
  }
}