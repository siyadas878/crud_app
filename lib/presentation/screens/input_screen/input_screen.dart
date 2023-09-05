// ignore_for_file: use_build_context_synchronously
import 'package:crud_app/applications/provider/data_provider,.dart';
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/textfield.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<GetAllProvider>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:const Text('Add Data')),
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(controller: context.read<GetAllProvider>().nameController,
            labelText: 'title'),
            SizedBox(height: size.height * 0.03),
            TextFieldWidget(controller: context.read<GetAllProvider>().descriptionController,
            labelText: 'description',maxlines: 2),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
                  onPressed: provider.isLoading
                      ? null 
                      : () async {
                          await provider.postData(
                            DataModel(
                              name: provider.nameController.text,
                              description: provider.descriptionController.text,
                            ),
                          );
                          warning(context, 'Successfully added');
                          Navigator.pop(context);
                        },
                  child: provider.isLoading
                      ?const CircularProgressIndicator()
                      :const Text('Add Task'),
                )
          ],
        ),
      ))),
    );
  }
}


