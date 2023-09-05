import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/infrastructure/api_calls/delete_data.dart';
import 'package:flutter/material.dart';
import '../../infrastructure/api_calls/add_data.dart';
import '../../infrastructure/api_calls/getall_data.dart';

class GetAllProvider extends ChangeNotifier {
  
  bool isLoading = false;
  List<DataModel>? datas;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<List<DataModel>?> getalldata() async {
    datas = await fetchData();
    notifyListeners();
    return datas;
  }

  postData(DataModel data) async {
    isLoading = true;
    await addData(data);
    isLoading = false;
    nameController.clear();
    descriptionController.clear();
    notifyListeners();
  }

  deleteDataProvider(String id) async {
    await deletData(id);
    isLoading = false;
    notifyListeners();
  }
}
