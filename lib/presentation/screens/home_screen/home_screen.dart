// ignore_for_file: use_build_context_synchronously
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/screens/input_screen/input_screen.dart';
import 'package:crud_app/presentation/screens/update_screen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../applications/provider/data_provider,.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Consumer<GetAllProvider>(
          builder: (context, value, child) {
            return FutureBuilder<List<DataModel>?>(
              future: GetAllProvider().getalldata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data'));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    int count = index + 1;
                    return SizedBox(
                      child: Card(
                        child: Center(
                          child: ListTile(
                            onTap: () {},
                            leading: CircleAvatar(
                              radius: 40,
                              child: Center(child: Text(count.toString())),
                            ),
                            title: Text(snapshot.data![index].name!),
                            subtitle: Text(snapshot.data![index].description ??
                                'No description'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateScreen(
                                              data: DataModel(
                                                  id: snapshot.data![index].id,
                                                  description: snapshot
                                                      .data![index].description,
                                                  name: snapshot
                                                      .data![index].name)),
                                        ));
                                  },
                                  icon:
                                      const Icon(FontAwesomeIcons.penToSquare),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Delete'),
                                        content:
                                            const Text('Do yo want to Delete'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Delete'),
                                            onPressed: () async {
                                              await context
                                                  .read<GetAllProvider>()
                                                  .deleteDataProvider(snapshot
                                                      .data![index].id!);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(FontAwesomeIcons.trashCan),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InputScreen(),
              ));
        },
        child: const Icon(FontAwesomeIcons.fileCirclePlus),
      ),
    );
  }
}
