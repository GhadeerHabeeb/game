import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/find_letter/FindLetters.dart';
import 'package:game/LearnLetter/letterContainer.dart';
import 'package:game/MatchingLetter/MatchLetterPage.dart';


import 'package:game/components/Next.dart';
import 'package:game/components/progress_indicator.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body:/*MatchLetterPage(indexId: 0,LetterId: 0,),*/
     /* LetterContainer(LetterId: 0,),*/
      FindTheLetter(),
    ));
  }
}
