import 'package:flutter/material.dart';
import 'package:cinema/model/genre_model.dart';
import '../../service/api_service.dart';

enum GenreViewState {
  none,
  loading,
  error,
}

class GenreViewModel with ChangeNotifier {
  List<Genre> _genres = [];
  List<Genre> get genres => _genres;
  GenreViewState _state = GenreViewState.none;
  GenreViewState get state => _state;

  changeState(GenreViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllGenres() async {
    changeState(GenreViewState.loading);

    try {
      ApiService apiService = ApiService();
      final c = await apiService.getGenreList();
      _genres = c;
      notifyListeners();
      changeState(GenreViewState.none);
    } catch (e) {
      changeState(GenreViewState.error);
    }
  }
}
