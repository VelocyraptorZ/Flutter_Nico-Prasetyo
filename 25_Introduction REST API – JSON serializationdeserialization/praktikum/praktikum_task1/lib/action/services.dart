// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class MyService {
  final Dio dio = Dio();

  // ignore: non_constant_identifier_names
  Future GetUsers() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users');
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future createUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': name,
          'job': job,
        },
      );
      debugPrint(response.data.toString());
      final UserModel _usermodel = UserModel.fromJson(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future updateUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'job': job,
        },
      );
      debugPrint(response.data.toString());
      final UserModel _usermodel = UserModel.fromJson(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );
      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
