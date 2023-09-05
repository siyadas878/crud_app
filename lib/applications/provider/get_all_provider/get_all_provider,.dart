import 'package:crud_app/domain/data_model/data_model.dart';
import 'package:crud_app/infrastructure/api_calls/getall_data.dart';
import 'package:flutter/material.dart';

class GetAllProvider extends ChangeNotifier {
  List<DataModel>? datas;
  Future<List<DataModel>?> getalldata() async{
    datas= await fetchData();
    return datas;
  }
}