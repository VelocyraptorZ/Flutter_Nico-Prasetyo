// ignore_for_file: unused_local_variable, duplicate_ignore
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceAPI {
  final Dio dio = Dio();

  Future getData() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users/4');
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future createData({
    required String name,
    required String program,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'program': program,
        },
      );
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future updateData({
    required String name,
    required String program,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'program': program,
        },
      );
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteData() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }
}
