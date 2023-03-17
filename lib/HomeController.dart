import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{
  RxInt count=0.obs;
  RxList Letters=[].obs;

  void LetterAddList(RxString letter){
    Letters.add(letter);
    count++;
    print(count);
    if(count==7)
      {
        Get.defaultDialog(
          title: '',
          middleText: 'you win try again',
          confirm: ElevatedButton(onPressed: (){}, child: Text('yes',style: TextStyle(fontSize: 20),)),
          cancel: ElevatedButton(onPressed: (){}, child: Text('no',style: TextStyle(fontSize: 20),))
        );
      }
  }

}