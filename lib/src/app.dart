import 'package:flutter/material.dart';
import 'package:meals_app/src/features/onboarding/view/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const Onboarding(),
    );
  }
}
