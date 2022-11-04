import 'cast_list_model.dart';
import 'genre_model.dart';
import 'movie_image_model.dart';

class MovieDetail {
  String? id;
  String? title;
  String? backdropPath;
  String? budget;
  String? homePage;
  String? originalTitle;
  String? overview;
  String? releaseDate;
  String? runtime;
  String? voteAverage;
  String? voteCount;
  String? trailerId;

  MovieImage? movieImage;

  List<Genre>? genres;

  List<Cast>? castList;

  MovieDetail(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.budget,
      required this.homePage,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage,
      required this.voteCount});

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'].toString();
    homePage = json['home_page'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    runtime = json['runtime'].toString();
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'].toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'backdropPath': backdropPath,
      'budget': budget,
      'homePage': homePage,
      'originalTitle': originalTitle,
      'overview': overview,
      'releaseDate': releaseDate,
      'runtime': runtime,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
