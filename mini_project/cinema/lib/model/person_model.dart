// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String? id;
  String? gender;
  String? name;
  String? profilePath;
  String? knownForDepartment;
  String? popularity;

  Person({
    this.id,
    this.gender,
    this.name,
    this.profilePath,
    this.knownForDepartment,
    this.popularity,
  });

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    gender = json['gender'].toString();
    name = json['name'];
    profilePath = json['profile_path'];
    knownForDepartment = json['known_for_department'];
    popularity = json['popularity'].toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gender': gender,
      'name': name,
      'profilePath': profilePath,
      'knownForDepartment': knownForDepartment,
      'popularity': popularity
    };
  }
}
