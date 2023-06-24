import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final fontStyle = const TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Vaju Makwana',
        theme: ThemeData(
            primarySwatch: Colors.cyan,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        home: const Home(),
        debugShowCheckedModeBanner: false);
  }
}
