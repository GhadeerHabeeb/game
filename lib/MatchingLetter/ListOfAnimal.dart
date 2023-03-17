import 'package:flutter/material.dart';


class Animal{

  final String FirstLetter;
  final String AniName;
  final String img;


  Animal({required this.FirstLetter,required this.AniName,required this.img});
}

List<Animal> ListContent=[
  Animal(FirstLetter: 'أ', AniName:'أسد', img: 'assets/images/5.png'),
  Animal(FirstLetter: 'ب', AniName:'بطة', img: 'assets/images/6.png'),
  Animal(FirstLetter: 'ت', AniName:'تفاحة', img: 'assets/images/apple.png'),
  Animal(FirstLetter: 'ث', AniName:'ثعلب', img: 'assets/images/8.png'),
  Animal(FirstLetter: 'ح', AniName:'حصان', img: 'assets/images/7.png'),


];

List<Color> colors=[
  Colors.cyan,
  Colors.greenAccent,
  Colors.yellow,
  Colors.red,
  Colors.pinkAccent,

];


