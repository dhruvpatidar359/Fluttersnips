import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttersnips/firebase_options.dart';
import 'package:fluttersnips/services/auth/auth_repository.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  await authRepositoryInstance.isLoggedIn();
  setPathUrlStrategy();
  registerSingletons();

  runApp(const App());
}

Future<void> registerSingletons() async {
  GetIt.I.registerSingleton<SideBarProvider>(Get.put(SideBarProvider()));
  GetIt.I.registerSingleton<SearchProvider>(Get.put(SearchProvider()));
}

// Syntatic sugar for common state manager classes
SideBarProvider get sideBarProvider => GetIt.I.get<SideBarProvider>();
SearchProvider get searchProvider => GetIt.I.get<SearchProvider>();
