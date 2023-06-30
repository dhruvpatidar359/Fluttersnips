import 'package:flutter/material.dart';
import 'package:fluttersnips/widgets/WidList/shapes/shapeWidList.dart';

import '../../../Models/cardModel.dart';
import '../card/cardWidList.dart';

List<CardModel> shapeListW = [
  CardModel(
      "avinashjindal7866@gmail.com",
      '''class SquareShape extends StatefulWidget {
  const SquareShape({super.key});

  @override
  State<SquareShape> createState() => _SquareShapeState();
}

class _SquareShapeState extends State<SquareShape> {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: 400,
        height: 400,
        child: CustomPaint(
          painter: OpenPainter(rectColor: Color(0xffffffff), rectSize: Size(200, 250)),
        ),
      
    );
  }
}

class OpenPainter extends CustomPainter {
  Color rectColor;
  Size rectSize;

  OpenPainter({required this.rectColor, required this.rectSize});

  // ignore: empty_constructor_bodies
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = rectColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(100, 100) & rectSize, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
''',
      "Shapes",
      SquareShape(),
      "Square Shape using Canvas"),
  CardModel(
      "avinashjindal7866@gmail.com",
      '''class TriangleShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CustomPaint(size: const Size(200, 200), painter: DrawTriangle()),
      ),
    );
  }
}

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.green);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

''',
      "Shapes",
      TriangleShape(),
      "Triangle Shape using Canvas"),
  CardModel(
      "avinashjindal7866@gmail.com",
      '''class PentagonShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: DrawPentagon(),
        child: Container(
          color: Colors.red,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}

class DrawPentagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height * 1 / 3),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height * 1 / 3),
      Offset(size.width * 4 / 5, size.height),
      Offset(size.width * 1 / 5, size.height),
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

''',
      "Shapes",
      PentagonShape(),
      "Pentagon Shape using Canvas"),
  CardModel(
      "avinashjindal7866@gmail.com",
      '''class HexagonShape extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Center(
          child: ClipPath(
            clipper: DrawHexagon(),
            child: Container(
              color: Colors.blue,
              width: 300,
              height: 300,
            ),
          ),
        );
  }
}

class DrawHexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([Offset(0, size.height / 2), Offset(size.width * 1 / 3, size.height), Offset(size.width * 2 / 3, size.height), Offset(size.width, size.height / 2), Offset(size.width * 2 / 3, 0), Offset(size.width * 1 / 3, 0)], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

''',
      "Shapes",
      HexagonShape(),
      "Hexagon Shape using Canvas"),
];
