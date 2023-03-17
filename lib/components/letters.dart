import 'package:flutter/material.dart';


class Letters{
    int LetterId;
  final String Letter;
 final int count;
 final String img;
 final String audio;

  Letters({required this.audio ,required this.img,required this.Letter,required this.LetterId,required this.count});
}
List<Letters> LettersContent=
[Letters(
   LetterId:0,
    Letter:'أ',
    count: 2,
    img: 'assets/images/5.png',
    audio:'audio/lion.mp3',
    ),
  Letters(
    LetterId: 1,
    Letter:'ب',
    count: 2,
      img: 'assets/images/6.png',
    audio:'audio/duck.mp3',
  ),
  Letters(
    LetterId: 2,
    Letter:'ت',
    count: 3,
    img: 'assets/images/apple.png',
    audio:'audio/apple.mp3',
  ),
  Letters(
    LetterId: 3,
    Letter:'ث',
    count: 4,
    img: 'assets/images/apple.png',
    audio:'audio/apple.mp3',
  ),
  Letters(
    LetterId: 4,
    Letter:'ح',
    count: 1,
    img: 'assets/images/8.png',
    audio:'audio/apple.mp3',
  ),
  Letters(
    LetterId: 5,
    Letter:'ح',
    count: 1,
    img: 'assets/images/7.png',
    audio:'audio/apple.mp3',
  ),


];