import 'package:flutter/material.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/screens/ShowCase/presentation/ShowCase.dart';
import 'package:fluttersnips/shared/exports.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp(
        title: 'FlutterSnips',
        home: const Showcase(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: const ColorScheme.dark(
              background: Colors.black,
              primary: primaryColor,
              onPrimary: Colors.white),
          useMaterial3: true,
        ),
      ),
    );
  }
}
