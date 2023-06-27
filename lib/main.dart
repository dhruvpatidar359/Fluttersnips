import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttersnips/Constants/AppColors.dart';
import 'package:fluttersnips/firebase_options.dart';
import 'package:fluttersnips/screens/ShowCase/presentation/ShowCase.dart';


void main() async {
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterSnips',
      theme: ThemeData(
       
        primaryColor: primaryColor,
        
        colorScheme: const ColorScheme.dark(background: Colors.black,primary: primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Showcase()
    );
  }

 
}
