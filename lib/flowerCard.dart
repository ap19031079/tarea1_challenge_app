import 'package:flutter/material.dart';
import 'package:tarea1_challenge_app/colors.dart';
import 'package:tarea1_challenge_app/flower.dart';

class Flowercard extends StatelessWidget {
  Flower flower;
  Flowercard(this.flower);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 40;
    double cardHeight = size.height * .57;

    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          buildTopText(),
          buildBackgroundImage(cardWidth, cardHeight, size),
          buildAboveCard(cardWidth, cardHeight, size),
          buildFlowerImage(size),
          buildBlurImage(cardWidth, size),
        ],
      ),
    );
  }

  Widget buildTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            flower.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: flower.lightColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBackgroundImage(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            flower.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildAboveCard(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height * .15,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: flower.darkColor.withOpacity(.50),
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Tulipa',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              flower.description,
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  width: 1,
                ),
                Image.asset('images/info.png')
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFlowerImage(Size size) {
    return Positioned(
      bottom: 20,
      right: -size.width * .7 / 2 + 30,
      child: Image.asset(
        flower.flowerImage,
        height: size.height * .4 - 10,
      ),
    );
  }
}
