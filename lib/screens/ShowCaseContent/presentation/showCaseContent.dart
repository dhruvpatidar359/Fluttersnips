import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/Models/cardModel.dart';
import 'package:google_fonts/google_fonts.dart';

class showCaseContent extends StatefulWidget {
  final List<CardModel> listW;

  const showCaseContent({Key? key, required this.listW}) : super(key: key);

  @override
  State<showCaseContent> createState() => _showCaseContentState();
}

class _showCaseContentState extends State<showCaseContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                 final Widget contentWidget =
                    widget.listW[index].wid ?? Center(child:Text('Rendering is in Progress',style:GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    )));
                return GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.listW[index].title,
                           style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                    
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: contentWidget,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,8),
                          child: ElevatedButton( 
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Code - Contributed By: ${(widget.listW[index].email)}',style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                    
                                    ),),
                                    content: SingleChildScrollView(
                                      child: Text(
                                        getCodeForIndex(index),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                                text: getCodeForIndex(index)),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Code copied to clipboard'),
                                            ),
                                          );
                                        },
                                        child: const Text('Copy Code',style: TextStyle(color: primaryColor)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Close',style: TextStyle(color: primaryColor)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('View Code',style: TextStyle(color: primaryColor),),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: widget.listW.length,
            ),
          ),
        ],
      ),
    );
  }

  String getCodeForIndex(int index) {
    // Replace this with your logic to get the code for the specific index
    // You can use the index to retrieve the code for the corresponding item
    return widget.listW[index].code;
  }
}
