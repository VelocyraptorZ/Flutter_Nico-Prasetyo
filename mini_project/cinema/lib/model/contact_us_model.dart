// ignore_for_file: non_constant_identifier_names

class ContactUsModel {
  late int? id;
  late String FirstName;
  late String LastName;
  late String Email;
  late String Problem;

  ContactUsModel({
    this.id,
    required this.FirstName,
    required this.LastName,
    required this.Email,
    required this.Problem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'FirstName': FirstName,
      'LastName': LastName,
      'Email': Email,
      'Problem': Problem,
    };
  }

  ContactUsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    FirstName = map['FirstName'];
    LastName = map['LastName'];
    Email = map['Email'];
    Problem = map['Problem'];
  }
}
