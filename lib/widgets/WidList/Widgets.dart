import 'package:flutter/material.dart';


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

