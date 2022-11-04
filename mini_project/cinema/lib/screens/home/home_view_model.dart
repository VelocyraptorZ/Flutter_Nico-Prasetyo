import 'package:flutter/material.dart';
import '../../model/movie_model.dart';
import '../../service/api_service.dart';

enum MovieViewState {
  none,
  loading,
  error,
}

class MovieViewModel with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  List<Movie> _moviesbygenre = [];
  List<Movie> get moviesbygenre => _moviesbygenre;
  MovieViewState _state = MovieViewState.none;
  MovieViewState get state => _state;

  changeState(MovieViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllMovies(int movieId, String query) async {
    changeState(MovieViewState.loading);

    try {
      ApiService apiService = ApiService();
      if (movieId == 0) {
        final c = await apiService.getNowPlayingMovie();
        _movies = c;
      } else {
        final c = await apiService.getMovieByGenre(movieId);
        _moviesbygenre = c;
      }
      notifyListeners();
      changeState(MovieViewState.none);
    } catch (e) {
      changeState(MovieViewState.error);
    }
  }
}
