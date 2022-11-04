import 'package:flutter/material.dart';

import '../../model/person_model.dart';
import '../../service/api_service.dart';

enum PersonViewState {
  none,
  loading,
  error,
}

class PersonViewModel with ChangeNotifier {
  List<Person> _persons = [];
  List<Person> get persons => _persons;
  PersonViewState _state = PersonViewState.none;
  PersonViewState get state => _state;

  changeState(PersonViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllPerson() async {
    changeState(PersonViewState.loading);

    try {
      ApiService apiService = ApiService();
      final c = await apiService.getTrendingPersons();
      _persons = c;
      notifyListeners();
      changeState(PersonViewState.none);
    } catch (e) {
      changeState(PersonViewState.error);
    }
  }
}
