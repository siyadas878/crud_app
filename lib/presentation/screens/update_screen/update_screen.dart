import 'package:crud_app/applications/provider/data_provider,.dart';
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/textfield.dart';

class UpdateScreen extends StatelessWidget {
  final DataModel data;
  const UpdateScreen({super.key,required this.data});

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
            TextFieldWidget(
                controller: context.read<GetAllProvider>().updateNameController,
                labelText: 'title'),
            SizedBox(height: size.height * 0.03),
            TextFieldWidget(
                controller:
                    context.read<GetAllProvider>().updateDescriptionController,
                labelText: 'description'),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: () async {
                await context.read<GetAllProvider>().updateDataProvider(
                      DataModel(
                        name:
                            context.read<GetAllProvider>().updateNameController.text,
                        description: context
                            .read<GetAllProvider>()
                            .updateDescriptionController
                            .text,
                            id: data.id
                      ),
                    );
                // ignore: use_build_context_synchronously
                warning(context, 'Successfully Updated');
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: context.read<GetAllProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Update Task'),
            )
          ],
        ),
      ))),
    );
  }
}
