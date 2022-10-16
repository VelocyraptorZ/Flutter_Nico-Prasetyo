import 'package:flutter/cupertino.dart';
import '../../api/contact_api.dart';
import '../../model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final c = await ContactAPI.getContact();
    _contacts = c;
    notifyListeners();
  }
}
