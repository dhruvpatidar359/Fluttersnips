import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 194, 203),
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11))),
        child: const Text(
          "Elevated Button",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ));
  }
}

class Button2 extends StatelessWidget {
  const Button2({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: const Text(
          'Text Button',
          style: TextStyle(color: Color.fromARGB(255, 0, 194, 203)),
        ));
  }
}

class Button3 extends StatelessWidget {
  const Button3({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 20, 216, 226),
                ),
                borderRadius: BorderRadius.circular(50))),
        child: const Text(
          "Outlined Button",
          style: TextStyle(color: Color.fromARGB(255, 0, 194, 203)),
        ));
  }
}

class Button4 extends StatefulWidget {
  const Button4({super.key});

  @override
  State<Button4> createState() => _Button4State();
}

class _Button4State extends State<Button4> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() => _isLoading = true);
        await Future.delayed(const Duration(seconds: 3));
        setState(() => _isLoading = false);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 194, 203),
          fixedSize: const Size(200, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: _isLoading
          // ignore: sized_box_for_whitespace
          ? Container(
              width: 200,
              height: 100,
              child: const Row(
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text('Please wait...',
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)))
                ],
              ),
            )
          : const Text("Animated Button",
              style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255))),
    );
  }
}
