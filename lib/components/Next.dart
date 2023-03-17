
import 'package:flutter/material.dart';
import 'package:game/LearnLetter/letterContainer.dart';

import 'package:get/get.dart';

import 'letters.dart';


class NextLetter extends StatefulWidget {

   int index;
   NextLetter({Key? key,required this.index}) : super(key: key);
  @override
  State<NextLetter> createState() => _NextLetterState();
}

class _NextLetterState extends State<NextLetter> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('أحسنت عملا',style: TextStyle(

            fontSize: 33,
          ),)),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: (){
            if(widget.index==LettersContent.length ) {

               widget.index=0;
               print('ok');
              Get.to(LetterContainer(
                LetterId:widget.index,

              ));

            }
            else
              {

                Get.to(LetterContainer(
                  LetterId:LettersContent[widget.index].LetterId,
                ));
              }
          }, child:Text('الحرف التالي',style: TextStyle(
               fontFamily: "Tajawal",
                fontSize: 20,
                ),))
                    ],
      ),
    );
  }
}
