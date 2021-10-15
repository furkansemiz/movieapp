import 'category.dart';

class Movie {
  int _id;
  int _userId;
  String _name;
  Category _category;

  int get id => _id;

  int get userId => _userId;

  String get name => _name;

  Category get category => _category;

  Movie({int id, int userId, String name, Category category}) {
    _id = id;
    _userId = userId;
    _name = name;
    _category = category;
  }

  Movie.fromJson(dynamic json) {
    _id = json["id"];
    _userId = json["userId"];
    _name = json["name"];
    _category =
        json["category"] != null ? Category.fromJson(json["category"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["userId"] = _userId;
    map["name"] = _name;
    if (_category != null) {
      map["category"] = _category.toJson();
    }
    return map;
  }

  bool isEqual(Movie movie) {
    return this.id == movie.id;
  }

  @override
  String toString() => name;
}
