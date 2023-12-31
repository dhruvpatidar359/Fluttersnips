import 'package:flutter/material.dart';
import 'package:fluttersnips/constants/app_colors.dart';
import 'package:fluttersnips/router.dart';
import 'package:fluttersnips/shared/exports.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchController()),
      ],
      child: MaterialApp.router(
        title: 'FlutterSnips',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.dark(
            background: Colors.black,
            primary: primaryColor,
            onPrimary: Colors.white,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
