// ignore_for_file: use_build_context_synchronously
import 'package:crud_app/applications/provider/data_provider,.dart';
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/textfield.dart';

class UpdateScreen extends StatelessWidget {
  final DataModel data;
  const UpdateScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.read<GetAllProvider>();

    provider.updateNameController.text = data.name!;
    provider.updateDescriptionController.text = data.description!;

    return Scaffold(
      appBar: AppBar(title: const Text('Update Data')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldWidget(
                  controller: provider.updateNameController,
                  labelText: 'title',
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldWidget(
                  controller: provider.updateDescriptionController,
                  labelText: 'description',
                  maxlines: 2,
                ),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                  onPressed: provider.isLoading
                      ? null
                      : () async {
                          await provider.updateDataProvider(
                            DataModel(
                              name: provider.updateNameController.text,
                              description: provider.updateDescriptionController.text,
                              id: data.id,
                            ),
                          );
                          warning(context, 'Successfully Updated');
                          Navigator.pop(context);
                        },
                  child: provider.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Update Task'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
