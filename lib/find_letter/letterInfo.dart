import 'package:flutter/material.dart';
import 'package:game/HomeController.dart';
import 'package:get/get.dart';

class LetterInfo extends StatefulWidget {
  final RxDouble right;
    final  RxDouble top;
  final RxString Letter;
     final Color color;
     final RxInt rotate;
   LetterInfo({required this.rotate,required this.top,required this.right,required this.Letter,required this.color,Key? key}) : super(key: key);

  @override
  State<LetterInfo> createState() => _LetterInfoState();
}

class _LetterInfoState extends State<LetterInfo> {

  RxDouble targetValue = 50.0.obs;
  RxDouble rotateValue=30.0.obs;

  final controller=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return    Stack(
      children: [
        Positioned(
          right:widget.right.value,
          top: widget.top.value,
          child:TweenAnimationBuilder<double>(
            curve: Curves.bounceInOut,
            tween: Tween<double>(begin: 50, end: targetValue.value),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double size, Widget? child) {
              return  RotatedBox(
                quarterTurns:targetValue==100.0?  0:widget.rotate.value,
                child: TextButton(

                  style:TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: size,

                    ),

                  ),
                  onPressed: (){

                   setState(() {
                     targetValue = 100.0.obs ;

                     if(targetValue.value==100)
                       {
                         targetValue.value=0;


                       }


                   });
                   controller.LetterAddList(widget.Letter);
                  },
                  child:child!,
                ),
              );
            },
            child: Text(widget.Letter.value,style: TextStyle(color: widget.color,),),
          ),
        ),
    ]

    );
  }
}
