import 'package:flutter/material.dart';
import '../../api/program_api.dart';
import '../../model/program_model.dart';

class ProgramViewModel with ChangeNotifier {
  List<Program> _programs = [];
  List<Program> get programs => _programs;

  getAllPrograms() async {
    final c = await ProgramAPI.getProgram();
    _programs = c;
    notifyListeners();
  }
}
