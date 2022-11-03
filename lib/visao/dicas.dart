
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
                                       'Um banho de 15 minutos pode gastar até135 litros de água. Se você reduzir o tempo embaixo do chuveiro para 5 minutos, apenas 45 litros são utilizados. Portanto, o ideal é optar por banhos rápidos, que durem o tempo necessário para fazer a higienização do corpo. Além disso, para potencializar a economia, desligue o chuveiro ao lavar o cabelo e ao se ensaboar.',
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
                                  'As torneiras também são grandes responsáveis pelo desperdício. Escovar os dentes e lavar o rosto e as mãos com a torneira aberta pode representar um gasto de 12 litros de água. Por isso, feche-as bem sempre que não estiver usando a água.',
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
                              '3. Ensaboe todas as louças de uma só vez \n\n '
                                  'Antes de lavar a louça, retire os restos de comida com o apoio de um guardanapo ou toalha de papel e ensaboe todas de uma só vez, com a torneira fechada. Depois, faça o enxágue. Outra dica é lavar os utensílios menos engordurados primeiro. Assim, a gordura não se espalha para os outros itens.',
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
                              '4. Limite o uso da máquina de lavar \n\n '
                                  'O ideal é usar a máquina sempre cheia e em ciclos completos de lavagem. Para isso, acumule mais roupas para lavar tudo de uma vez. Alguns eletrodomésticos mais modernos também oferecem um modo econômico, que gasta até 30% menos água e energia.',
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
                              '5. Reaproveite a água da máquina de lavar \n\n '
                                  'A água utilizada na máquina de lavar costuma ser descartada pelo ralo. No entanto, por conter apenas resíduos de sabão, na maioria dos casos, ela pode ser reaproveitada e servir para lavar pisos, lavar o quintal e até regar plantas. Caso precise guardar essa água por alguns dias, o ideal é utilizar um pouco de cloro para evitar a proliferação de micro-organismos que causam mau cheiro.',
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
                              '6. Não lave calçadas com mangueira \n\n '
                                  'Lavar a calçada com mangueira é uma atitude pouco consciente e pode representar um gasto de 120 litros de água. Em Fortaleza, por exemplo, existe multa para quem faz uso contínuo de água nessa atividade. Portanto, prefira usar a vassoura para limpar o quintal e a calçada.',
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
                              '7. Implemente a descarga com válvula de duplo acionamento \n\n '
                                  'Usar sempre a mesma quantidade de água na descarga é desperdício. Já existem sistemas desenvolvidos para liberar água na bacia sanitária de acordo com a necessidade. A válvula de duplo acionamento pode ser instalada tanto em descargas de parede quanto em caixas acopladas.',
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
                                  'Infiltrações e vazamentos podem acontecer sem que você perceba e representar um elevado desperdício de água – além de dar um susto na conta que chega no final do mês. Goteiras e manchas na parede são indícios que aparecem quando problemas maiores já se instalaram há mais tempo. Outros sinais são mofo, pintura com bolhas, pintura com aspecto umedecido e bolor. Nesses casos, o ideal é buscar ajuda especializada.',
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
                                  'Torneira vazando é fácil de perceber e pode desperdiçar até 40 litros de água por dia. Se perceber esse problema, é fundamental realizar a troca ou o conserto. Se a resolução for demorar alguns dias, não deixe de recolher a água para que seja possível reutilizá-la. ',
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
                                  'Não use a mangueira para lavar o carro — opte por baldes, que evitam o desperdício. Outra forma de economizar é a ecolavagem, que deixa o veículo limpo e protegido com menos de um litro de água. Basta ter dois panos de microfibra, um shampoo especial para lavagem e um borrifador com 400 ml de água.',
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