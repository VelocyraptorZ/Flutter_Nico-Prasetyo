// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import '../model/cast_list_model.dart';
import '../model/genre_model.dart';
import '../model/movie_detail_model.dart';
import '../model/movie_image_model.dart';
import '../model/movie_model.dart';
import '../model/person_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=b28f9cb8bea2883dc20a4d142ca9caf4';

  APIService() {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<List<Movie>> getNowPlayingMovie() async {
    try {
      final url = '$baseUrl/movie/now_playing?$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> getMovieByGenre(int movieId) async {
    try {
      final url = '$baseUrl/discover/movie?with_genres=$movieId&$apiKey';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Genre>> getGenreList() async {
    try {
      final response = await _dio.get('$baseUrl/genre/movie/list?$apiKey');
      var genres = response.data['genres'] as List;
      List<Genre> genreList = genres.map((g) => Genre.fromJson(g)).toList();
      return genreList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Person>> getTrendingPersons() async {
    try {
      final response = await _dio.get('$baseUrl/trending/person/week?$apiKey');
      var persons = response.data['results'] as List;
      List<Person> personList = persons.map((p) => Person.fromJson(p)).toList();
      return personList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$movieId?$apiKey');
      MovieDetail movieDetail = MovieDetail.fromJson(response.data);

      movieDetail.genres = await getGenreList();

      movieDetail.trailerId = await getYoutubeId(movieId);

      movieDetail.movieImage = await getMovieImage(movieId);

      movieDetail.castList = await getCastList(movieId);

      return movieDetail;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$id/videos?$apiKey');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<MovieImage> getMovieImage(int movieId) async {
    try {
      final response = await _dio.get('$baseUrl/movie/$movieId/images?$apiKey');
      return MovieImage.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Cast>> getCastList(int movieId) async {
    try {
      final response =
          await _dio.get('$baseUrl/movie/$movieId/credits?$apiKey');
      var list = response.data['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast(
              name: c['name'],
              profilePath: c['profile_path'],
              character: c['character']))
          .toList();
      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
