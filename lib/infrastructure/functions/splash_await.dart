import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crud_app/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/widgets/warning.dart';

wait(context) async {
  var connectivityResult = await Connectivity().checkConnectivity();
  await Future.delayed(const Duration(seconds: 2));
  if (connectivityResult == ConnectivityResult.none) {
    warning(context, 'No Interner Connection');
  }
  Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
}