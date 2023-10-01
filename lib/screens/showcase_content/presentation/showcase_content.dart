import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersnips/constants/app_colors.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:selectable_code_view/selectable_code_view.dart';

class ShowCaseContent extends StatefulWidget {
  final List data;
  final int crossAxisCount;

  const ShowCaseContent(
      {Key? key, required this.data, required this.crossAxisCount})
      : super(key: key);

  @override
  State<ShowCaseContent> createState() => _ShowCaseContentState();
}

class _ShowCaseContentState extends State<ShowCaseContent> {
  List filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      crossAxisCount: widget.crossAxisCount,
      padding: const EdgeInsets.fromLTRB(40, 110, 40, 30),
      children: List.generate(
        widget.data.length,
        (index) {
          final Widget contentWidget = widget.data[index].widget ??
              Center(
                child: Text(
                  'Rendering is in Progress',
                  style: GoogleFonts.poppins(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              );
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey[800]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(14),
                        ),
                        child: contentWidget,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Container(
                    color: const Color(0xFF131313),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            widget.data[index].title,
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        ),
                        ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 12),
                            child: Text(
                              'View Code',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Code - Contributed By: ${(widget.data[index].email)}',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  content: SingleChildScrollView(
                                    child: SelectableCodeView(
                                      code: getCodeForIndex(index),
                                      language: Language.DART,
                                      languageTheme: LanguageTheme.vscodeDark(),
                                      fontSize: 14.0,
                                      withZoom: true,
                                      withLinesCount: true,
                                      expanded: false,
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

                                        Navigator.pop(context);

                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(snackBar);
                                      },
                                      child: const Text(
                                        'Copy Code',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String getCodeForIndex(int index) {
    // Replace this with your logic to get the code for the specific index
    // You can use the index to retrieve the code for the corresponding item
    return widget.data[index].code;
  }
}
