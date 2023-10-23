import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttersnips/firebase_options.dart';
import 'package:fluttersnips/services/auth/auth_repository.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await initializeApp();
  runApp(const App());
}

Future<void> initializeApp() async {
  try {
    await dotenv.load(fileName: '.env');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await authRepositoryInstance.isLoggedIn();
    setPathUrlStrategy();
    registerSingletons();
  } catch (e) {
    print('Error initializing app: $e');
  }
}

Future<void> registerSingletons() async {
  GetIt.I.registerSingleton<SideBarProvider>(SideBarProvider());
  GetIt.I.registerSingleton<SearchProvider>(SearchProvider());
}

// Syntactic sugar for common state manager classes
SideBarProvider get sideBarProvider => GetIt.I.get<SideBarProvider>();
SearchProvider get searchProvider => GetIt.I.get<SearchProvider>();
