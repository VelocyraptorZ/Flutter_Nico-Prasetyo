class UserModel {
  late String? name;
  late String? job;

  UserModel({
    required this.name,
    required this.job,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'job': job,
    };
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    job = map['job'];
  }
}
