import 'screenshot_model.dart';

class MovieImage {
  List<Screenshot>? backdrops;
  List<Screenshot>? posters;

  MovieImage({this.backdrops, this.posters});

  MovieImage.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <Screenshot>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(Screenshot.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <Screenshot>[];
      json['posters'].forEach((v) {
        posters!.add(Screenshot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toMap()).toList();
    }
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
