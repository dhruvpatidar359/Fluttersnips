import 'package:flutter/material.dart';
import 'package:fluttersnips/models/card_model.dart';
import 'package:fluttersnips/widgets/wild_list/card/card_wild_list.dart';
import 'package:glassy/glassy_card.dart';

const List<CardModel> cardListW = [
  CardModel(
    'dhruvpatidar35@gmail.com',
    '''class ModuleCard extends StatefulWidget {
  const ModuleCard({Key? key}) : super(key: key);

  @override
  State<ModuleCard> createState() => _ModuleCardState();
}

class _ModuleCardState extends State<ModuleCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: ((event) {
              setState(() {
                isHovered = false;
              });
            }),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  height: isHovered ? 300.0 : 280.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.easeOut,
                  top: isHovered ? -100.0 : 0.0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 375),
                    curve: Curves.easeOut,
                    height: isHovered ? 390.0 : 280.0,
                    width: 250.0,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 375),
                            curve: Curves.easeOut,
                            height: isHovered ? 180.0 : 220.0,
                            width: isHovered ? 180.0 : 220.0,
                            child: Container(
                              color: Colors.yellow,
                            )),
                      ),
                      const Text(
                        "Module One",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  'This is the best module of the world and any body can contribute to this ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                   
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        );
  }
}

''',
    'card',
    ModuleCard(),
    'Animated Card',
  ),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class ModuleCard1 extends StatefulWidget {
  const ModuleCard1({Key? key}) : super(key: key);

  @override
  State<ModuleCard1> createState() => _ModuleCardState1();
}

class _ModuleCardState1 extends State<ModuleCard1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void _reverseAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MouseRegion(
          onEnter: (event) {
            _startAnimation();
          },
          onExit: ((event) {
            _reverseAnimation();
          }),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 280.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: Colors.brown[300],
                  borderRadius: BorderRadius.circular(20.0) ,
                ),
                child: Center(child: Row( mainAxisAlignment: MainAxisAlignment.center,   children:[RandomAvatar('sadsasonz', height: 40, width: 40),RandomAvatar('sadsadfsasonz', height: 40, width: 40),RandomAvatar('sadsdagsasonz', height: 40, width: 40),RandomAvatar('sadsasosadfnz', height: 40, width: 40)])),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return FractionallySizedBox(
                    widthFactor: _animation.value,
                    heightFactor: _animation.value,
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    
                                    child: Container(
                                     child:RandomAvatar('sadsasonz', height: 40, width: 40),
                                    ),
                                  ),
                                  Expanded(

                                    child: Container(

                                      child:RandomAvatar('sadsadfsasonz', height: 40, width: 40),
                                     
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                     
                                      child:RandomAvatar('sadsdagsasonz', height: 40, width: 40),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                    child:RandomAvatar('sadsdafgaasonz', height: 40, width: 40),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
''',
      'Card',
      ProfilesAnimated(),
      'ProfilesAnimated'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
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
}''',
      'card',
      TiltWidget(
        yaxis: 1,
        text: 'Title',
        subText: "Subtext",
      ),
      'Tilt Widget'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      ''' 
class RadialAnimationCard extends StatefulWidget {
  @override
  _RadialAnimationCardState createState() => _RadialAnimationCardState();
}

class _RadialAnimationCardState extends State<RadialAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          colors: [
            Colors.yellow.withOpacity(0.8),
            Colors.orange.withOpacity(0.8),
          ],
          radius: _animation.value * 2,
        ),
      ),
      child: Center(
        child: Text(
          'Radial Animation Card',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
''',
      'card',
      RadialAnimationCard(),
      'RadialAnimatedCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class AnimatedContainerCard extends StatefulWidget {
  @override
  _AnimatedContainerCardState createState() => _AnimatedContainerCardState();
}

class _AnimatedContainerCardState extends State<AnimatedContainerCard> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpansion,
      child: AnimatedContainer(
        height: _isExpanded ? 300 : 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 10),
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Center(
          child: Text(
            'Animated Container Card',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}''',
      'card',
      AnimatedContainerCard(),
      'AnimatedContainerCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class AnimatedPositionedCard extends StatefulWidget {
  @override
  _AnimatedPositionedCardState createState() => _AnimatedPositionedCardState();
}

class _AnimatedPositionedCardState extends State<AnimatedPositionedCard> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpansion,
      child: Stack(
        children: [
          Container(
            height: _isExpanded ? 300 : 200,
            width: 300,
            color: Colors.blue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: _isExpanded ? 50 : 0,
            left: _isExpanded ? 50 : 0,
            child: Container(
              height: _isExpanded ? 200 : 100,
              width: _isExpanded ? 200 : 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  'Animated Positioned Card',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
''',
      'card',
      AnimatedPositionedCard(),
      'AnimatedPositionedCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class ShadowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Shadow Card',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

''',
      'card',
      ShadowCard(),
      'ShadowCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class AnimatedCard extends StatefulWidget {
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: FlutterLogo(size: 100),
        ),
      ),
    );
  }
}



''',
      'card',
      AnimatedCard(),
      'AnimatedCard'),
  CardModel(
      'dhruvpatidar35@gmai.com',
      '''
class GradientCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              'Gradient Card',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
''',
      'card',
      GradientCard(),
      'GradientCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: Container(
        height: 200,
        width: 300,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final angle = _animation.value * 3.14;
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: Card(
            child: _isFront
                ? Center(child: Text('Front', style: TextStyle(fontSize: 20)))
                : Center(child: Text('Back', style: TextStyle(fontSize: 20))),
          ),
        ),
      ),
    );
  }
}


''',
      'card',
      FlipCard(),
      'FlipCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
  class StackedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 300,
          child: Card(
            child: Center(
              child: Text(
                'Background Card',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Container(
            height: 100,
            width: 200,
            child: Card(
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Foreground Card',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}''',
      'card',
      StackedCard(),
      'StackedCard'),
  CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class ListCard extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}

''',
      'card',
      ListCard(),
      'ListCard'),
  CardModel(
    'dhruvpatidar35@gmail.com',
    '''library glassy;

import 'package:glassy/glassy_config.dart';

GlassyConfig glassyConfig = GlassyConfig();

/// Main Glassy Class.
class Glassy {
  /// Set default configuration
  void setConfig(GlassyConfig conf) {
    glassyConfig = conf;
  }
}

import 'package:flutter/material.dart';

/// Glass Configuration that can determines configs of all glassy widgets
class GlassyConfig {
  GlassyConfig(
      {this.radius = 15,
      this.backgroundOpacity = 0.2,
      this.backgroundColor = Colors.grey,
      this.borderColor,
      this.foregroundColor = Colors.white,
      this.borderOpacity = 0.5}) {
    borderColor = borderColor ?? backgroundColor;

    borderColor = borderColor!.withOpacity(borderOpacity);
    backgroundColor = backgroundColor.withOpacity(backgroundOpacity);
  }

  /// the radius of all glassy widgets in px
  /// default value is "15"
  double radius;

  /// the opacity of background of all glassy widgets
  /// default value is "0.5"
  double backgroundOpacity;

  /// the opacity of border of all glassy widgets
  /// default value is "0.5"
  double borderOpacity;

  /// the color of background of all glassy widgets
  /// default value is "Colors.grey"
  Color backgroundColor;

  /// the color of foreground of all glassy widgets
  /// default value is "Colors.white"
  Color foregroundColor;

  /// the color of border of all glassy widgets
  /// default value is "Colors.grey"
  Color? borderColor;
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassy/glassy.dart';
import 'package:glassy/glassy_config.dart';

/// a card that has glass effects
class GlassyCard extends StatelessWidget {
  const GlassyCard({required this.child, this.config, super.key});

  /// a widget that placed as child of card
  final Widget child;

  /// optional configuration of glass effect
  final GlassyConfig? config;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: (config ?? glassyConfig).backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: (config ?? glassyConfig).borderColor!),
          borderRadius: BorderRadius.circular((config ?? glassyConfig).radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
              Radius.circular((config ?? glassyConfig).radius)),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: child),
        ));
  }
}




// OR WE CAN ALSO USE THIS SIMPLE CODE

Container(
width: MediaQuery.of(context).size.width,
margin: const EdgeInsets.only(left: 20.0, right: 20.0),
padding: EdgeInsets.all(28.0),
decoration: new BoxDecoration(
color:   const Color(0x36454F).withOpacity(0.5),// opacity
border: new Border.all(color: Colors.white70,
),
borderRadius: BorderRadius.all(Radius.circular(40.0)),
),
child: Container(),
),

''',
    'card',
    GlassyCard(
        child: SizedBox(
      height: 200,
      width: 200,
    )),
    'Glassy',
  ),
];
