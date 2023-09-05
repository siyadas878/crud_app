import 'package:crud_app/applications/provider/get_all_provider/get_all_provider,.dart';
import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:const Text('Home Screen'),centerTitle: true,),
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
                  height: size.height*0.1,
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
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
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
    );
  }
}
