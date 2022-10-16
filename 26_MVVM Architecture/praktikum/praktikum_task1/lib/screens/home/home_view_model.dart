import 'package:flutter/material.dart';
import 'package:praktikum_task1/api/service_api.dart';

class HomeViewModel with ChangeNotifier {
  String _data = '';
  String get data => _data;

  getData() async {
    final response = await ServiceAPI().getData();
    _data = response.toString();
    notifyListeners();
  }

  createUser(String name, String program) async {
    final response =
        await ServiceAPI().createData(name: name, program: program);
    _data = response.toString();
    notifyListeners();
  }

  updateUser(String name, String program) async {
    final response =
        await ServiceAPI().updateData(name: name, program: program);
    _data = response.toString();
    notifyListeners();
  }

  deleteUser() async {
    final response = await ServiceAPI().deleteData();
    _data = response.toString();
    notifyListeners();
  }
}
