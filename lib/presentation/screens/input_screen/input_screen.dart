import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:30),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'title', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height*0.03),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'description', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: size.height*0.03),
                    ElevatedButton(
                        onPressed: () {
                          
                          Navigator.pop(context);
                        },
                        child: const Text('Add Task'))
                      ],
                    ),
              ))),
    );
  }
}
