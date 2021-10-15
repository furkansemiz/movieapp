
import 'package:movieapp/models/user.dart';

import 'category.dart';
import 'movie.dart';

class SaveFile {
  List<User> _users;
  List<Category> _categories;
  List<Movie> _movies;

  List<User> get users => _users;
  List<Category> get categories => _categories;
  List<Movie> get movies => _movies;

  SaveFile({
      List<User> users,
      List<Category> categories,
      List<Movie> movies}){
    _users = users;
    _categories = categories;
    _movies = movies;
}

  SaveFile.fromJson(dynamic json) {
    if (json["users"] != null) {
      _users = [];
      json["users"].forEach((v) {
        _users.add(User.fromJson(v));
      });
    }
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories.add(Category.fromJson(v));
      });
    }
    if (json["movies"] != null) {
      _movies = [];
      json["movies"].forEach((v) {
        _movies.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_users != null) {
      map["users"] = _users.map((v) => v.toJson()).toList();
    }
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    if (_movies != null) {
      map["movies"] = _movies.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

