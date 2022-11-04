// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  List<int>? genre;
  int? voteCount;
  String? voteAverage;
  String? error;

  Movie({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.genre,
    this.voteCount,
    this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    genre = json['genre_ids'].cast<int>();
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'].toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'backdropPath': backdropPath,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'video': video,
      'genre': genre,
      'voteCount': voteCount,
      'voteAverage': voteAverage
    };
  }
}
