import 'package:flutter/material.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/services/auth/AuthRepository.dart';
import 'package:fluttersnips/widgets/NavBar/presentation/CustomDialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/cardModel.dart';

class NavBar extends StatefulWidget {
  final Function(String) onSearch;

  const NavBar({super.key, required this.onSearch});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final TextEditingController _searchController = TextEditingController();
  Widget contentWidget = Container();
  int contriCount = 0;

  void handleSearch(String query) {
    widget.onSearch(query);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        Uri.parse('https://github.com/dhruvpatidar359/Fluttersnips.git'))) {
      throw Exception('Could not launch url');
    }
  }

  List<CardModel> searchItems(List<CardModel> items, String query) {
    return items
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (authRepositoryInstance.name == null) {
      contentWidget = defaultProfile();
    } else {
      contentWidget = loggedInProfile();
    }

    return Column(
      children: [
        Container(
          child: Row(
              children: [search(), contributeBtn('Contribute'), contentWidget]),
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
                    handleSearch(_searchController.text);
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
                        label: const Text('FlutterSnips',
                            style: TextStyle(color: primaryColor)), // <-- Text
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
                        label: Text('GitHub',
                            style: TextStyle(color: primaryColor)), // <-- Text
                      ),
                    ]),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text('Close', style: TextStyle(color: primaryColor)),
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

  Widget defaultProfile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
      child: GestureDetector(
        onTap: () async {
          // do the login
          await authRepositoryInstance.signInWithGoogle(context);
          if (authRepositoryInstance.name != null) {
            setState(() {
              contentWidget = loggedInProfile();
            });
          }
        },
        child: Row(
          children: [
            RandomAvatar('saytoonz', height: 40, width: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
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
      ),
    );
  }

  Widget loggedInProfile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
      child: GestureDetector(
        onTap: () async {
          if (authRepositoryInstance.uid != null &&
              authRepositoryInstance.imageUrl != null &&
              authRepositoryInstance.name != null) {
            contriCount = await authRepositoryInstance
                .getContributionCount(authRepositoryInstance.uid!);

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return logginDialog();
              },
            );
          } else {
            // Handle null values here
            // Display an error message or handle the situation accordingly
          }
        },
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircleAvatar(
                radius: 20,
                child: ImageNetwork(
                  borderRadius: BorderRadius.circular(20),
                  image: authRepositoryInstance.imageUrl!,
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
              child: Text(
                authRepositoryInstance.name!,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logginDialog() {
    return AlertDialog(
      title: const Text('Profile', style: TextStyle(color: primaryColor)),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          children: [
            ImageNetwork(
                borderRadius: BorderRadius.circular(20),
                image: authRepositoryInstance.imageUrl!,
                height: 40,
                width: 40),
            Text(
              authRepositoryInstance.name!,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              authRepositoryInstance.userEmail!,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '💘 Contribution Count : ${(contriCount)}',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: primaryColor)),
        ),
        ElevatedButton(
          onPressed: () async {
            await authRepositoryInstance.signOutGoogle(context);
            setState(() {
              contentWidget = defaultProfile();
            });
            Navigator.of(context).pop();
          },
          child: const Text('Logout', style: TextStyle(color: primaryColor)),
        ),
      ],
    );
  }
}
