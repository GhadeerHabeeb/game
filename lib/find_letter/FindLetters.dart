import 'package:flutter/material.dart';
import 'package:game/HomeController.dart';
import 'package:game/find_letter/letterInfo.dart';
import 'package:get/get.dart';

class FindTheLetter extends StatelessWidget {
   FindTheLetter({Key? key}) : super(key: key);

  final controller=Get.find<HomeController>();
//pic and the letters
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('جد الحروف من الصورة',style: TextStyle(
              fontSize: 30,
              fontFamily: 'Tejewal',

            ),),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.lightBlueAccent
            ),
            child: Obx(() => Center(
              child: Text('${controller.count}',style: TextStyle(fontSize: 40),),
            ),)
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            image:DecorationImage(image:AssetImage('assets/images/SCHOOL.png'),fit: BoxFit.cover)
          ),

          child:Stack(
            children: [
              LetterInfo(right:20.0.obs,top: 100.0.obs,Letter: 'E'.obs, color:Colors.blue,rotate: 45.obs,),
              LetterInfo(right:120.0.obs,top: 20.0.obs,Letter: 'e'.obs, color:Colors.lightBlueAccent,rotate: 30.obs,),
              LetterInfo(right:40.0.obs,top: 10.0.obs,Letter: 'b'.obs, color:Colors.green,rotate: 45.obs,),
              LetterInfo(right:270.0.obs,top: 0.0.obs,Letter: 'a'.obs, color:Colors.brown,rotate: 30.obs,),
              LetterInfo(right:120.0.obs,top: 180.0.obs,Letter: 'i'.obs, color:Colors.pinkAccent,rotate: 0.obs,),
              LetterInfo(right:250.0.obs,top: 40.0.obs,Letter: 'A'.obs, color:Colors.greenAccent,rotate: 30.obs,),
              LetterInfo(right:250.0.obs,top: 200.0.obs,Letter: 'B'.obs, color:Colors.greenAccent,rotate: 30.obs,),

            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Container(
          height: MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.Letters.length,
              itemBuilder: (buildContext,index){
                return  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    width: 50,
                    color: Colors.green,
                    child: Stack(
                        children:[
                          Positioned(
                            top:-2,
                              left: -2,
                              child: Icon(Icons.star,color: Colors.yellowAccent,)),
                          Center(child: Text('${controller.Letters[index]}',style: TextStyle(color: Colors.white,fontSize: 50),))]));

              },
              separatorBuilder: (buildContext,index){
                return  Container(

                  width: 20,

                );
              },

            ),
          ),
        )

        )],
        ),
      ),
    ));
  }
}


