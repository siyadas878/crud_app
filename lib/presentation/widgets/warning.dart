import 'package:crud_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

warning(BuildContext context, String warning) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: tealColor,
    content: Text(warning,style:const TextStyle(color: Colors.white),),
  ));
}