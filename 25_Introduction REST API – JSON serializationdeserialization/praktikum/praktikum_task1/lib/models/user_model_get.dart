// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModelGet {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List? data;
  Map? support;

  UserModelGet(
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  );

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'total': total,
      'totalPages': totalPages,
      'data': data,
      'support': support
    };
  }

  UserModelGet.fromJson(Map<String, dynamic> map) {
    page = map['page'];
    perPage = map['perPage'];
    total = map['total'];
    totalPages = map['totalPages'];
    data = map['data'];
    support = map['support'];
  }
}
