
import 'package:flutter/material.dart';
import 'package:game/LearnLetter/letterContainer.dart';

import 'package:get/get.dart';

class ProgressTimerFinish extends StatelessWidget {
  const ProgressTimerFinish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Text('إنتهى الوقت',style: TextStyle(

              fontFamily: 'Tajawal',
              fontSize: 44,
            ),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
              ),
            ),
              onPressed: (){

               Get.to(LetterContainer(LetterId: 0));
              }, child: Icon(Icons.refresh_sharp,size: 30,))
        ],
      ),
    );
  }
}







