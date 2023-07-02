import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

// This file is having the functionality of google sign in and google signout

AuthRepository authRepositoryInstance = AuthRepository();
final firestoreInstance = FirebaseFirestore.instance;

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();

  factory AuthRepository() {
    return _singleton;
  }

  AuthRepository._internal();

  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn =
      GoogleSignIn(clientId: "${(dotenv.env['GOOGLE_SIGNIN_CLIENT_ID'])}");

  String? name;
  String? imageUrl;
  String? uid;
  String? userEmail;

  Future<void> signOutGoogle(BuildContext context) async {
    try {
      await googleSignIn.signOut();
      await _firebaseAuth.signOut();

      uid = null;
      name = null;
      userEmail = null;
      imageUrl = null;

      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,

        behavior: SnackBarBehavior.fixed,

        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Success!',
          message: 'Logged Out From Your Google Account',
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
    } catch (error) {
      debugPrint('Google Sign-Out Error: $error');
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,

        behavior: SnackBarBehavior.fixed,

        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Failed!',
          message: 'Logout failed. Please Try Again.',
          messageFontSize: 15,
          titleFontSize: 20,
          color: Colors.red.shade700,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    User? user;
    try {
      // Trigger the Google Authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the Google SignIn object
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the obtained auth details
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        user = userCredential.user;
      }

      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,

        behavior: SnackBarBehavior.fixed,

        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Success!',
          message: 'Login Success!',
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
    } catch (error) {
      debugPrint('Google Sign-In Error: $error');
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,

        behavior: SnackBarBehavior.fixed,

        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Failed',
          message: 'Login Failed, Please Try Again!',
          messageFontSize: 15,
          titleFontSize: 20,
          color: Colors.red.shade700,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  }

  Future<void> isLoggedIn() async {
    // Check the user's login status using your authentication mechanism
    // Return true if the user is logged in, false otherwise
    // Example with Firebase Authentication:
    final User? user = _firebaseAuth.currentUser;

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  }

  Future<int> getContributionCount(String userId) async {
    int contributionCount = 0;
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');
    // print('i am working');

    try {
      final QuerySnapshot snapshot =
          await collection.where('userId', isEqualTo: userId).get();

      if (snapshot.docs.isEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .add({'contributionCount': 0, 'userId': userId});
      } else {
        final Map<String, dynamic>? data =
            snapshot.docs[0].data() as Map<String, dynamic>?;

        if (data != null) {
          contributionCount = data['contributionCount'] ?? 0;
        }
      }

      return contributionCount;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Future<void> increaseContriCount(String userId) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('users');

    try {
      final QuerySnapshot snapshot =
          await collection.where('userId', isEqualTo: userId).get();

      if (snapshot.docs.isEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .add({'contributionCount': 1, 'userId': userId});
      } else {
        final Map<String, dynamic>? data =
            snapshot.docs[0].data() as Map<String, dynamic>?;

        if (data != null) {
          int currentCount = data['contributionCount'] ?? 0;
          int updatedCount = currentCount + 1;

          // Update the document with the new contribution count
          await snapshot.docs[0].reference
              .update({'contributionCount': updatedCount});
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
