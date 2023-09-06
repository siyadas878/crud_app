// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/widgets/warning.dart';
import '../../../applications/provider/data_provider,.dart';
import '../../widgets/textfield.dart';

class UpdateScreen extends StatefulWidget {
  final DataModel data;

  const UpdateScreen({Key? key, required this.data}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateNameController.text = widget.data.name!;
    updateDescriptionController.text = widget.data.description!;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = context.read<GetAllProvider>();

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
                  controller: updateNameController,
                  labelText: 'title',
                ),
                SizedBox(height: size.height * 0.03),
                TextFieldWidget(
                  controller: updateDescriptionController,
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
                              name: updateNameController.text,
                              description: updateDescriptionController.text,
                              id: widget.data.id,
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

  @override
  void dispose() {
    updateNameController.dispose();
    updateDescriptionController.dispose();
    super.dispose();
  }
}
