import 'package:dio/dio.dart';
import '../model/program_model.dart';

class ProgramAPI {
  static Future<List<Program>> getProgram() async {
    final response = await Dio()
        .get("https://mocki.io/v1/fc7ff8e9-4a13-41ea-8149-701398ef63a0");

    List<Program> programs = (response.data as List)
        .map(
          (e) => Program(
            name: e['name'],
            program: e['program'],
          ),
        )
        .toList();
    return programs;
  }
}
