import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttersnips/constants/app_colors.dart';
import 'package:fluttersnips/services/auth/auth_repository.dart';
import 'package:fluttersnips/widgets/nav_bar/presentation/custom_dialog.dart';
import 'package:fluttersnips/widgets/search_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/card_model.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget contentWidget = Container();
  int contributionCount = 0;

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

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 30),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                contributeBtn('Contribute'),
                const Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: SearchBox(),
                  ),
                ),
                contentWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contributeBtn(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 45,
        child: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Select Your Contributing Platform"),
                  content: SizedBox(
                    height: 100,
                    child: Column(children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const MyCustomDialog();
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
                        label: const Text('GitHub',
                            style: TextStyle(color: primaryColor)), // <-- Text
                      ),
                    ]),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close',
                          style: TextStyle(color: primaryColor)),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.add, color: Colors.white),
          label: Text(
            'Contribute',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              // fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget defaultProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Tooltip(
        message: authRepositoryInstance.name != null
            ? authRepositoryInstance.name!
            : 'Click to Login',
        child: InkWell(
          onTap: () async {
            await authRepositoryInstance.signInWithGoogle(context);
            if (authRepositoryInstance.name != null) {
              setState(() {
                contentWidget = loggedInProfile();
              });
            }
          },
          child: RandomAvatar('saytoonz', height: 40, width: 40),
        ),
      ),
    );
  }

  Widget loggedInProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: () async {
          if (authRepositoryInstance.uid != null &&
              authRepositoryInstance.imageUrl != null &&
              authRepositoryInstance.name != null) {
            contributionCount = await authRepositoryInstance
                .getContributionCount(authRepositoryInstance.uid!);

            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return logginDialog();
                },
              );
            }
          } else {
            // Handle null values here
            // Display an error message or handle the situation accordingly
          }
        },
        child: SizedBox(
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
              '💘 Contribution Count : ${(contributionCount)}',
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
            if (mounted) Navigator.of(context).pop();
          },
          child: const Text('Logout', style: TextStyle(color: primaryColor)),
        ),
      ],
    );
  }
}
