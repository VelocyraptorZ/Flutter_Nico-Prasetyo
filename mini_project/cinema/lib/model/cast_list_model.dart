class CastList {
  List<Cast>? cast;

  CastList(this.cast);
}

class Cast {
  String? name;
  String? profilePath;
  String? character;

  Cast({this.name, this.profilePath, this.character});

  Cast.fromJson(dynamic json) {
    name = json['name'];
    profilePath = json['profile_path'];
    character = json['character'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePath': profilePath,
      'character': character,
    };
  }
}
