import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/widgets/NavBar/presentation/AddWidgetDialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://flutter.dev'))) {
      throw Exception('Could not launch url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(children: [search(), contributeBtn('Contribute'), profile()]),
        ),
      ],
    );
  }

  Widget search() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          // Add padding around the search bar
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // Use a Material design search bar
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              cursorColor: primaryColor,
              textAlign: TextAlign.center,
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF202020),
                hintStyle: GoogleFonts.poppins(
                  color: const Color(0xFF838383),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Type your search here',

                // Add a clear button to the search bar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                // Add a search icon or button to the search bar
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Perform the search here
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget contributeBtn(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        // Increase the button height as desired
        height: 45,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Decrease the border radius
              ),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Select Your Contributing Platform"),
                  content: Container(
                    height: 100,
                    child: Column(children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return MyCustomDialog();
                              });
                        },
                        icon: const Icon(
                          // <-- Icon
                          Icons.emoji_emotions,
                          color: primaryColor,
                          size: 24.0,
                        ),
                        label: const Text('FlutterSnips',style: TextStyle(color: primaryColor)), // <-- Text
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _launchUrl();
                        },
                        icon: const Icon(
                          // <-- Icon
                          Icons.emoji_emotions_outlined,
                          color: primaryColor,
                          size: 24.0,
                        ),
                        label: Text('GitHub',style: TextStyle(color: primaryColor)), // <-- Text
                      ),
                    ]),
                  ),
                  actions: [
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
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Contribute',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 8, 16, 8),
      child: Row(
        children: [
          ProfilePicture(
            img:
                'https://firebasestorage.googleapis.com/v0/b/flusnip.appspot.com/o/flutterlogo.png?alt=media&token=077386a3-c669-4417-be0c-e71e2efcf42e',
            fontsize: 20.0,
            name: 'Dhruv',
            radius: 20.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 8, 16, 8),
            child: Text(
              'Dhruv Patidar',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
