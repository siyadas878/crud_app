import 'dart:convert';
import 'dart:developer';
import '../../domain/data_model/data_model.dart';
import 'package:http/http.dart' as http;


Future<void> addData(DataModel newData) async {
  final response = await http.post(
    Uri.parse("https://64f6a5e89d77540849526cb3.mockapi.io/tasks"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(newData.toJson()),
  );

  if (response.statusCode == 201) {
    log('success');
  } else {
    throw Exception(
        "Failed to add data. Status code: ${response.statusCode}");
  }
}

