import 'package:flutter/cupertino.dart';
import 'package:praktikum_task/models/contact_model.dart';

class ContactManager extends ChangeNotifier {
  final _contactModels = <ContactModel>[];
  // ignore: recursive_getters
  List<ContactModel> get contactModels => List.unmodifiable(_contactModels);

  void deleteContact(int index) {
    _contactModels.removeAt(index);
    notifyListeners();
  }

  void addContact(ContactModel contact) {
    _contactModels.add(contact);
    notifyListeners();
  }
}
