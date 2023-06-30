import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/Models/cardModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selectable_code_view/selectable_code_view.dart';

class showCaseContent extends StatefulWidget {
  final List<CardModel> listW;
  final int crossAxisCount;

  const showCaseContent(
      {Key? key, required this.listW, required this.crossAxisCount})
      : super(key: key);

  @override
  State<showCaseContent> createState() => _showCaseContentState();
}

class _showCaseContentState extends State<showCaseContent> {
  List<CardModel> filteredList = [];

  @override
  void initState() {
    // TODO: implement initState
    filteredList = widget.listW;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final Widget contentWidget = widget.listW[index].wid ??
                    Center(
                        child: Text('Rendering is in Progress',
                            style: GoogleFonts.poppins(
                                fontSize: 25, fontWeight: FontWeight.w600)));
                return GestureDetector(
                  onTap: () {},
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
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: contentWidget,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Code - Contributed By: ${(widget.listW[index].email)}',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: SingleChildScrollView(
                                      child: SelectableCodeView(
                                        code:
                                            getCodeForIndex(index), // Code text
                                        language: Language.DART, // Language
                                        languageTheme:
                                            LanguageTheme.vscodeDark(), // Theme
                                        fontSize: 14.0, // Font size
                                        withZoom:
                                            true, // Enable/Disable zoom icon controls
                                        withLinesCount:
                                            true, // Enable/Disable line number
                                        expanded:
                                            false, // Enable/Disable container expansion
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                                text: getCodeForIndex(index)),
                                          );
                                          final snackBar = SnackBar(
                                            /// need to set following properties for best effect of awesome_snackbar_content
                                            elevation: 0,
                                            behavior: SnackBarBehavior.fixed,

                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              title: 'Enjoy!',
                                              message: 'Code Copied',
                                              messageFontSize: 15,
                                              titleFontSize: 20,
                                              color: Colors.green.shade700,

                                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                              contentType: ContentType.success,
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(snackBar);
                                        },
                                        child: const Text('Copy Code',
                                            style:
                                                TextStyle(color: primaryColor)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Close',
                                            style:
                                                TextStyle(color: primaryColor)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'View Code',
                              style: TextStyle(color: primaryColor),
                            ),
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
