import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/presentation/screens/input_screen/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../applications/provider/data_provider,.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<DataModel>?>(
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
                return SizedBox(
                  height: size.height * 0.1,
                  child: Card(
                    child: Center(
                      child: ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          radius: 40,
                          child: Center(child: Text(index.toString())),
                        ),
                        title: Text(snapshot.data![index].name ?? 'No title'),
                        subtitle: Text(snapshot.data![index].description ??
                            'No description'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.penToSquare),
                            ),
                            IconButton(
                              onPressed: () {},
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
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => InputScreen(),));
      },
      child:const Icon(FontAwesomeIcons.fileCirclePlus),
      ),
    );
  }
}
