import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PostModel {
  final String id;
  final PlatformFile cover;
  final String day;
  final Color theme;
  final String caption;

  PostModel(
      {required this.id,
      required this.cover,
      required this.day,
      required this.theme,
      required this.caption});
}
