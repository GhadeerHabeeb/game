/*import 'package:audioplayers/audioplayers.dart';*/
import 'package:flutter/material.dart';
import 'package:game/MatchingLetter/ListOfAnimal.dart';
import 'package:game/MatchingLetter/MatchLetterPage.dart';
import 'package:game/components/Next.dart';
import 'package:game/components/letters.dart';
import 'package:get/get.dart';
import 'dart:math';

class MatchLetterPage extends StatefulWidget {
  int indexId;
  int LetterId;
  MatchLetterPage({required this.LetterId,required this.indexId,Key? key}) : super(key: key);


  var AniList=[[1,2,3,4,0],[3,4,1,2,0],[0,2,3,4,1],[2,4,3,1,0],[3,2,1,4,0]];
  var AniRandom=0;
  @override
  State<MatchLetterPage> createState() => _MatchLetterPageState();
}

class _MatchLetterPageState extends State<MatchLetterPage> {

  bool dragCompleted=false;

 @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DragTarget(

                  builder: (_,__,   rejectedData)=> Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: colors[widget.LetterId],
                        child: Center(
                          child:Text(
                            '${LettersContent[widget.LetterId].Letter}',
                            style: TextStyle(fontFamily: 'Tajawal',fontSize: 50,color:Colors.white),),
                        ),
                      ),
                    ],
                  ),
                   onWillAccept: (data)=>true,

                   onAccept: (data){
                      setState(() {
                        print(widget.AniRandom);
                        print(ListContent[widget.AniList[widget.AniRandom][widget.indexId]].FirstLetter);
                        print(LettersContent[widget.LetterId].Letter);
                        if(widget.indexId<=ListContent.length) {
                    if (ListContent[widget.AniList[widget.AniRandom][widget.indexId]].FirstLetter ==
                        LettersContent[widget.LetterId].Letter) {
                      widget.LetterId++;
                      widget.AniRandom++;


                      Get.snackbar(
                        '',
                          '',
                          titleText:Text('إجابة صحيحة',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          messageText:Text( 'أحسنت عملا',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          
                          snackPosition: SnackPosition.BOTTOM
                      );
                      print(widget.LetterId);


                      Get.to(()=>MatchLetterPage(indexId:   widget.indexId,LetterId: widget.LetterId,));
                    } else {
                      dragCompleted = false;
                      Get.defaultDialog(
                        title: '😞',
                        titleStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                        middleText: 'إضغط على التالي',
                        middleTextStyle: TextStyle(
                          color: Colors.cyan,
                        ),
                        barrierDismissible: false,
                        content: ElevatedButton(
                            onPressed: () {
                                   Get.back();
                            },
                            child: Icon(
                              Icons.refresh,
                              size: 50,
                            )),
                      );
                    }
                  }
                        else
                          {
                          return;
                    }

                });
                   },

                ),
            SizedBox(
              width: 100,
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 9.0,),
                  itemCount: ListContent.length,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {

                    return  Draggable(
                      data: Animal,
                      feedback: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(ListContent[widget.AniList[widget.AniRandom][index]].img),
                      ),
                      childWhenDragging: Container(
                        height: 100,
                        color: Colors.grey[300],
                        child: Image.asset(ListContent[widget.AniList[widget.AniRandom][index]].img),
                      ),
                      child: Container(
                          height: 100,
                          color: Colors.amber[300],
                          child: Image.asset(ListContent[widget.AniList[widget.AniRandom][index]].img),
                        ),
                      onDragStarted: (){
                        widget.indexId=index;
                        print(widget.indexId);
                       /* final player = AudioPlayer();*/
                       /* player.play(
                            AssetSource(LettersContent[widget.AniList[widget.AniRandom][index]].audio));*/

                      },
                      onDragEnd: (_){
                        if(widget.LetterId==ListContent.length) {
                          widget.LetterId=0;
                          widget.AniRandom=0;

                          Get.to(() => MatchLetterPage(LetterId: 0, indexId: 0));}


                      },

                    );


                  }
              ),
            )
              ],
            ),
          ),
        ));
  }
}
