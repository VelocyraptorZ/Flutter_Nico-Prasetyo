import 'package:flutter/material.dart';
import '../../helper/database_helper.dart';
import '../../model/contact_us_model.dart';

class ContactUsViewModel extends ChangeNotifier {
  List<ContactUsModel> _contactusModels = [];
  List<ContactUsModel> get contactusModels => _contactusModels;
  late DatabaseHelper _dbHelper;

  ContactUsViewModel() {
    _dbHelper = DatabaseHelper();
    _getAllContactUs();
  }

  void _getAllContactUs() async {
    _contactusModels = await _dbHelper.getContactUs();
    notifyListeners();
  }

  Future<void> addContactUs(ContactUsModel contactusModel) async {
    await _dbHelper.insertContactUs(contactusModel);
    _getAllContactUs();
  }

  Future<ContactUsModel> getContactUsById(int id) async {
    return await _dbHelper.getContactUsById(id);
  }

  void updateContactUs(ContactUsModel contactusModel) async {
    await _dbHelper.updateContactUs(contactusModel);
    _getAllContactUs();
  }

  void deleteContactUs(int id) async {
    await _dbHelper.deleteContactUs(id);
    _getAllContactUs();
  }
}
