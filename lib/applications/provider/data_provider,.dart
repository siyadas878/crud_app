import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:flutter/material.dart';
import '../../infrastructure/api_calls/add_data.dart';
import '../../infrastructure/api_calls/getall_data.dart';

class GetAllProvider extends ChangeNotifier {
  List<DataModel>? datas;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<List<DataModel>?> getalldata() async {
    datas = await fetchData();
    notifyListeners();
    return datas;
  }

  postData(DataModel data) async { 
    await addData(data);
    notifyListeners();
  }
}
