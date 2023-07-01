import 'package:flutter/material.dart';

// Animated Card with animations
class ModuleCard extends StatefulWidget {
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
                                children: [],
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

// Tilt Widget

class TiltWidget extends StatefulWidget {
  final double yaxis;

  final String text;
  final String subText;

  const TiltWidget(
      {super.key,
      required this.yaxis,
      required this.text,
      required this.subText});

  @override
  State<TiltWidget> createState() => _TiltWidgetState();
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
      duration: const Duration(milliseconds: 300),
      tween: Tween(
        begin: beginX,
        end: endX,
      ),
      builder: (context, valueX, child) => TweenAnimationBuilder(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        tween: Tween(
          begin: beginY,
          end: endY,
        ),
        builder: (context, valueY, child) {
          return Transform(
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
                        (((yvalue - (-borderValueY)) * newRange) / oldRange) +
                            (-0.35);
                    beginY = y;
                    y = newValue;
                    endY = y;
                    oldRange = (borderValueX - (-borderValueX));
                    newRange = (0.35 - (-0.35));
                    newValue =
                        (((-xvalue - (-borderValueX)) * newRange) / oldRange) +
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
                    height: 600,
                    width: 600,
                    color: Colors.amber,
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
                              const SizedBox(
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
          );
        },
      ),
    );
  }
}

class ScaleAnimationCard extends StatefulWidget {
  const ScaleAnimationCard({super.key});

  @override
  State<ScaleAnimationCard> createState() => _ScaleAnimationCardState();
}

class _ScaleAnimationCardState extends State<ScaleAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
    final scale = 1 + (_animation.value * 0.2);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.scale(
        scale: scale,
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(
            child: Text(
              'Scale Animation Card',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingAnimationCard extends StatefulWidget {
  const FloatingAnimationCard({super.key});

  @override
  _FloatingAnimationCardState createState() => _FloatingAnimationCardState();
}

class _FloatingAnimationCardState extends State<FloatingAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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
    return Transform.translate(
      offset: Offset(0, -40 * _animation.value),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Colors.pink,
                Colors.deepPurple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(
            child: Text(
              'Floating Animation Card',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FlipAnimationCard extends StatefulWidget {
  const FlipAnimationCard({super.key});

  @override
  _FlipAnimationCardState createState() => _FlipAnimationCardState();
}

class _FlipAnimationCardState extends State<FlipAnimationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat(reverse: true);
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final frontRotation = _animation.value * 0.5 * 3.1415926535;
          final backRotation = (_animation.value - 0.5) * 0.5 * 3.1415926535;
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(frontRotation),
            alignment: Alignment.center,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(backRotation),
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Flip Animation Card',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RadialAnimationCard extends StatefulWidget {
  const RadialAnimationCard({super.key});

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
      duration: const Duration(seconds: 2),
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
      child: const Center(
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

class AnimatedContainerCard extends StatefulWidget {
  const AnimatedContainerCard({super.key});

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
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: const Center(
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
}

class AnimatedPositionedCard extends StatefulWidget {
  const AnimatedPositionedCard({super.key});

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
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: _isExpanded ? 50 : 0,
            left: _isExpanded ? 50 : 0,
            child: Container(
              height: _isExpanded ? 200 : 100,
              width: _isExpanded ? 200 : 100,
              color: Colors.red,
              child: const Center(
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

class ShadowCard extends StatelessWidget {
  const ShadowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
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

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({super.key});

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  const GradientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
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

class FlipCard extends StatefulWidget {
  const FlipCard({super.key});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
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
      child: SizedBox(
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
                ? const Center(
                    child: Text('Front', style: TextStyle(fontSize: 20)))
                : const Center(
                    child: Text('Back', style: TextStyle(fontSize: 20))),
          ),
        ),
      ),
    );
  }
}

class StackedCard extends StatelessWidget {
  const StackedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox(
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
          child: SizedBox(
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
}

class ListCard extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
