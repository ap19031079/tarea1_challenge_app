import 'package:flutter/material.dart';
import 'package:tarea1_challenge_app/colors.dart';
import 'package:tarea1_challenge_app/flower.dart';
import 'package:tarea1_challenge_app/flowerCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(viewportFraction: .8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[buildToolbar(), buildLogo(size), buildPager(size)],
        ),
      ),
    );
  }

  Widget buildToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Image.asset(
            'images/location.png',
            width: 30,
            height: 30,
          ),
          Spacer(),
          Image.asset(
            'images/drawer.png',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget buildLogo(Size size) {
    return Positioned(
      top: 10,
      right: size.width / 2 - 25,
      child: Image.asset(
        'images/logo.png',
        width: 50,
        height: 50,
      ),
    );
  }

  Widget buildPager(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      height: size.height - 50,
      child: PageView.builder(
          controller: pageController,
          itemCount: getFlowers().length,
          itemBuilder: (context, index) => Flowercard(getFlowers()[index])),
    );
  }

  List<Flower> getFlowers() {
    List<Flower> list = [];
    list.add(Flower(
        'Tulipán',
        'images/blur_tulip.png',
        'images/tulipan.png',
        'El tulipán (Tulipa) es una planta herbácea perenne de la familia Liliaceae, caracterizada por sus flores solitarias en forma de copa, pétalos simétricos y colores vibrantes. Su bulbo subterráneo almacena nutrientes, permitiéndole florecer en climas templados durante la primavera.',
        pinkDark,
        pinkLight));
    list.add(Flower(
        'Clavel',
        'images/blur_clavel.png',
        'images/clavel.png',
        'El clavel (Dianthus caryophyllus) es una planta perenne de la familia Caryophyllaceae, reconocida por sus flores fragantes y pétalos dentados que varían en colores desde blanco hasta rojo intenso. Se cultiva comúnmente como ornamental y posee un tallo erecto y resistente, ideal para arreglos florales.',
        pinkLight,
        pinkDark));
    // list.add(Flower(name, conName, backgroundImage, imageTop, imageSmall,
    //     imageBlur, flowerImage, description, darkColor, lightColor));
    // list.add(Flower(name, conName, backgroundImage, imageTop, imageSmall,
    //     imageBlur, flowerImage, description, darkColor, lightColor));
    return list;
  }
}
