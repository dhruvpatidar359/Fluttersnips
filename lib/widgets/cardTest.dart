import 'package:flutter/material.dart';



class TiltWidget extends StatefulWidget {
  final double yaxis;
 
  final String text;
  final String subText;

  TiltWidget(
      {required this.yaxis,
   
      required this.text,
      required this.subText});

  @override
  _TiltWidgetState createState() => _TiltWidgetState();
}

class _TiltWidgetState extends State<TiltWidget> {
  double x = 0.0;
  double y = 0.0;
  double borderValueY = 150.0;
  double borderValueX = 200.0;
  double beginY = 0.0;
  double endY = 0.0;
  double beginX = 0.0;
  double endX = 0.0;
  Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 300),
      tween: Tween(
        begin: beginX,
        end: endX,
      ),
      builder: (context, valueX, child) => TweenAnimationBuilder(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        tween: Tween(
          begin: beginY,
          end: endY,
        ),
        builder: (context, valueY, child) {
          return Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(valueX)
                  ..rotateY(valueY),
                alignment: FractionalOffset.center,
                child: MouseRegion(
                  onHover: (details) {
                    double yvalue = widget.yaxis - details.localPosition.dx;
                    double xvalue = (MediaQuery.of(context).size.height / 2) -
                        details.localPosition.dy;
          
                    if (yvalue <= borderValueY && yvalue >= -borderValueY) {
                      setState(() {
                        double oldRange = (borderValueY - (-borderValueY));
                        double newRange = (0.35 - (-0.35));
                        double newValue =
                            (((yvalue - (-borderValueY)) * newRange) /
                                    oldRange) +
                                (-0.35);
                        beginY = y;
                        y = newValue;
                        endY = y;
                        oldRange = (borderValueX - (-borderValueX));
                        newRange = (0.35 - (-0.35));
                        newValue = (((-xvalue - (-borderValueX)) * newRange) /
                                oldRange) +
                            (-0.35);
                        beginX = x;
                        x = newValue;
                        endX = x;
                      });
                    }
                  },
                  onExit: (event) {
                  
                    setState(() {
                      y = 0.0;
                      x = 0.0;
                      beginY = 0.0;
                      endY = 0.0;
                      beginX = 0.0;
                      endX = 0.0;
                    });
                  },
                  child: Stack(
                    children: [

                      Container(
                        height: 400,
                        width:  600,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image:NetworkImage('https://firebasestorage.googleapis.com/v0/b/flusnip.appspot.com/o/flutterlogo.png?alt=media&token=077386a3-c669-4417-be0c-e71e2efcf42e'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.0,
                        right: 20.0,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, -20.0),

                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        left: 20.0,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(0.0, 0.0, -30.0),
                          alignment: FractionalOffset.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.text,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.w700,
                                  color: textColor,
                                ),
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    widget.subText,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w300,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
