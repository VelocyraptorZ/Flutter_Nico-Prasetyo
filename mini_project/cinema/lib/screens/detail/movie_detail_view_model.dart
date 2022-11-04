import 'package:flutter/material.dart';

import '../../../model/movie_detail_model.dart';
import '../../../service/api_service.dart';
import '../../model/genre_model.dart';

enum MovieDetailViewState {
  none,
  loading,
  error,
}

class MovieDetailViewModel with ChangeNotifier {
  MovieDetail? moviedetails;
  List<Genre> _moviegenre = [];
  List<Genre> get moviegenre => _moviegenre;
  MovieDetailViewState _state = MovieDetailViewState.none;
  MovieDetailViewState get state => _state;

  changeState(MovieDetailViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllMovieDetails(int id) async {
    changeState(MovieDetailViewState.loading);

    try {
      ApiService apiService = ApiService();
      final c = await apiService.getMovieDetail(id);
      moviedetails = c;
      notifyListeners();
      changeState(MovieDetailViewState.none);
    } catch (e) {
      changeState(MovieDetailViewState.error);
    }
  }

  getMovieGenre() async {
    changeState(MovieDetailViewState.loading);

    try {
      ApiService apiService = ApiService();
      final c = await apiService.getGenreList();
      _moviegenre = c;
      notifyListeners();
      changeState(MovieDetailViewState.none);
    } catch (e) {
      changeState(MovieDetailViewState.error);
    }
  }
}
