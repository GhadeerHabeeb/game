import 'dart:ui';

/*import 'package:audioplayers/audioplayers.dart';*/
import 'package:flutter/material.dart';
import 'package:game/components/Next.dart';
import 'package:game/components/letters.dart';
import 'package:game/components/progress_indicator.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';


class LetterContainer extends StatefulWidget {
  int LetterId=0;
   LetterContainer({required this.LetterId,Key? key}) : super(key: key);

  @override
  State<LetterContainer> createState() => _LetterContainerState();
}

class _LetterContainerState extends State<LetterContainer> {
  @override
  void initState() {
    /*final player=AudioPlayer();
    player.play(AssetSource(LettersContent[widget.LetterId].audio));*/

    super.initState();
  }
  List<Offset> _points = <Offset>[];
  int count=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              Stack(

                children: [


                  Positioned(
                      top: 100,
                      right: 110,

                      child:   Text( LettersContent[widget.LetterId].Letter ,

                        style: TextStyle( fontSize: 200,color: Colors.grey[400],fontFamily: 'Tajawal'),
                      ),
                  ),

   GestureDetector(


                          onPanUpdate: (DragUpdateDetails details) {

                            setState(() {

                              Offset _localPosition = details.globalPosition;




                              if(_localPosition.dx>MediaQuery.of(context).size.width-100||_localPosition.dx<100||_localPosition.dy>350||_localPosition.dy<100)
                                {
                                  _points.clear();
                                  count=0;
                                  print(_points);
                                }
                              else{

                                _points = List.from(_points)..add(_localPosition);
                              }

                            });

                          },
                          onPanStart:(DragStartDetails details) {



                          },

                          onPanEnd: (DragEndDetails details) {


                            if(_points.isNotEmpty)
                              {
                                 count++;
                                 print(count);
                                 if(count== LettersContent[widget.LetterId].count) {
                                   widget.LetterId++;
                                   Get.to(NextLetter(
                                       index: widget.LetterId));
                                 }

                              }







                            _points.add(Offset.infinite);



                          },
                        child:Stack(
                          children: [

                            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,


              child: CustomPaint(
                            painter: CanvasPainter(_points),
                            willChange: true,
                            size: Size(300, 300),
                          ),
                      ),

                          ]
                        ),
                ),
                  Positioned(child: Progress(),),


                ]
              ),
              Divider(
                height: 10,
                color: Colors.orange,
                thickness: 10,
              ),
              SizedBox(
                height: 100,
              ),
              Image.asset(LettersContent[widget.LetterId].img,width: 200,height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}

class CanvasPainter extends CustomPainter {
  Paint? _paint;
  List<Offset> _points;

  CanvasPainter(this._points) {
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 1; i < this._points.length; i++) {
      if (_points[i - 1] != null && _points[i] != null) {
        canvas.drawLine(_points[i - 1], _points[i], _paint!);
      }
    }
  }

  @override
  bool shouldRepaint(CanvasPainter oldDelegate) {
    return oldDelegate._points != _points;
  }
}

class LetterTracerPainter2 extends CustomPainter {
  final String letter;


  LetterTracerPainter2({required this.letter,});

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: letter,
          style:TextStyle(
              color: Colors.black.withOpacity(.2), fontSize: 300.0,fontFamily: 'Tajawal')),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset( 150/2,100));

    List<LineMetrics> lines = textPainter.computeLineMetrics();
    //lines.map((e) => print(e));



    }


  @override
  bool shouldRepaint(LetterTracerPainter2 oldDelegate) {
    return  false;
  }
}

Widget Progress() {

  double progress=1.0;

  return
      Container(
        padding: EdgeInsets.symmetric(vertical: 20),

        child:LinearPercentIndicator(

          animation: true,
          animationDuration: 10000,
          lineHeight: 14.0,
          percent: progress,
          linearStrokeCap: LinearStrokeCap.round,
          backgroundColor: Colors.black.withOpacity(0.2),
          progressColor: Colors.blue,
          onAnimationEnd: (){
 
             Get.to(ProgressTimerFinish());
          },

        ),


  );

}
