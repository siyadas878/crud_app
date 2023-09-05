import 'dart:convert';
import '../../domain/data_model/data_model.dart';
import 'package:http/http.dart' as http;

Future<List<DataModel>> fetchData() async {
  final response =
      await http.get(Uri.parse("https://64f6a5e89d77540849526cb3.mockapi.io/tasks"));
  if (response.statusCode == 200) {
    final List<dynamic> jsonDataList = json.decode(response.body);
    final List<DataModel> dataList =
        jsonDataList.map((json) => DataModel.fromJson(json)).toList();
    return dataList;
  } else {
    throw Exception(
        "Failed to retrieve data. Status code: ${response.statusCode}");
  }
}
