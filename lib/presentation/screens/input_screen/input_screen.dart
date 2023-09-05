import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: 
      Center(child: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {
            
          }, child: Text('Submit'))
        ],
      ))),
    );
  }
}