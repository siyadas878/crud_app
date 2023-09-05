import 'package:crud_app/applications/provider/get_all_provider/get_all_provider,.dart';
import 'package:crud_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GetAllProvider(),
          ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
