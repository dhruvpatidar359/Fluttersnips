import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttersnips/app.dart';
import 'package:fluttersnips/firebase_options.dart';
import 'package:fluttersnips/services/auth/AuthRepository.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  await authRepositoryInstance.isLoggedIn();

  runApp(const App());
}