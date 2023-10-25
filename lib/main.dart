import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttersnips/firebase_options.dart';
import 'package:fluttersnips/services/auth/auth_repository.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:get_it/get_it.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  await authRepositoryInstance.isLoggedIn();
  setPathUrlStrategy();
  registerSingletons();
}

void main() async {
  // This captures errors reported by the Flutter framework.
  runZonedGuarded<Future<void>>(
    () async {
      await initApp();
      runApp(const App());
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
    ),
  );
}

Future<void> registerSingletons() async {
  GetIt.I.registerSingleton<SideBarProvider>(Get.put(SideBarProvider()));
  GetIt.I.registerSingleton<SearchProvider>(Get.put(SearchProvider()));
}

// Syntatic sugar for common state manager classes
SideBarProvider get sideBarProvider => GetIt.I.get<SideBarProvider>();
SearchProvider get searchProvider => GetIt.I.get<SearchProvider>();
