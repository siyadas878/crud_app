import 'dart:convert';
import 'dart:developer';
import '../../domain/data_model/data_model.dart';
import 'package:http/http.dart' as http;

Future<void> updateData(DataModel updatedData) async {
  String id=updatedData.id.toString();
  print(id??'----------------');
  final response = await http.put(
    Uri.parse("https://64f6a5e89d77540849526cb3.mockapi.io/tasks/$id"), 
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(updatedData.toJson()),
  );

  if (response.statusCode == 200) {
    log('success');
  } else {
    throw Exception(
        "Failed to update data. Status code: ${response.statusCode}");
  }
}
