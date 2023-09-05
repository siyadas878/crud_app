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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
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
            labelText: 'description'),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: () async {
                await context.read<GetAllProvider>().postData(
                      DataModel(
                        name:
                            context.read<GetAllProvider>().nameController.text,
                        description: context
                            .read<GetAllProvider>()
                            .descriptionController
                            .text,
                      ),
                    );
                // ignore: use_build_context_synchronously
                warning(context, 'Successfully added');
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: context.read<GetAllProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Add Task'),
            )
          ],
        ),
      ))),
    );
  }
}


