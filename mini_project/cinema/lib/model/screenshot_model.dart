class Screenshot {
  String? aspect;
  String? imagePath;
  int? height;
  int? width;
  String? countryCode;
  double? voteAverage;
  int? voteCount;

  Screenshot({
    this.aspect,
    this.imagePath,
    this.height,
    this.width,
    this.countryCode,
    this.voteAverage,
    this.voteCount,
  });

  Screenshot.fromJson(Map<String, dynamic> json) {
    aspect = json['aspect_ratio'].toString();
    imagePath = json['file_path'];
    height = json['height'];
    width = json['width'];
    countryCode = json['iso_639_1'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toMap() {
    return {
      'aspect': aspect,
      'imagePath': imagePath,
      'height': height,
      'width': width,
      'countryCode': countryCode,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
