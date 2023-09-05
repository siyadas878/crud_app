import 'dart:developer';
import 'package:http/http.dart' as http;

Future<void> deletData(String id) async {

  final response = await http.delete(
    Uri.parse("https://64f6a5e89d77540849526cb3.mockapi.io/tasks/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    log('Successfully updated data with ID: $id');
  } else if (response.statusCode == 404) {
    log('Data with ID $id not found.');
  } else {
    throw Exception("Failed to update data with ID $id. Status code: ${response.statusCode}");
  }
}
