import 'package:crud_app/core/constants/constants.dart';
import 'package:crud_app/infrastructure/functions/splash_await.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    wait(context);
    return  Scaffold(
      backgroundColor: tealColor,
      body: SafeArea(
          child: Center(
        child: Text('Crud App',
        style: GoogleFonts.jollyLodger(
        fontSize: 40,color: Colors.black
      ),),
      )),
    );
  }
}


