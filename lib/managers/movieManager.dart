import 'package:flutter/cupertino.dart';
import 'package:movieapp/mockServer/mockServer.dart';
import 'package:movieapp/models/category.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/utils/debugTool.dart';

class MovieManager extends ChangeNotifier {
  List<Movie> movies = [];
  List<Category> categories = [];

  static final MovieManager _MovieManager = MovieManager._internal();

  factory MovieManager() {
    return _MovieManager;
  }

  MovieManager._internal();

  Future<void> initialize() async {
    movies = await MockServer().getMovies();
    categories = await MockServer().getCategories();
    debugPrint("Gelen boyutlar:" +
        movies.length.toString() +
        " :" +
        categories.length.toString());
    notifyListeners();
  }

  Future<void> notify() async {
    movies = await MockServer().getMovies();
    categories = await MockServer().getCategories();
    notifyListeners();
  }

  Future<List<Category>> searchCategory(String filter) async {
    List<Category> result = [];

    categories.forEach((element) {
      if (element.name.contains(filter)) {
        result.add(element);
      }
    });
    return result;
  }

  Future<void> addMovie(
      {int userId,
      String name,
      Category category,
      BuildContext context}) async {
    if (userId == null ||
        name == null ||
        name == "" ||
        category == null ||
        context == null) {
      showSnack(context: context, responseMessage: "Tüm alanları doldurun.");
      return;
    }

    try {
      await MockServer()
          .addMovie(name: name, category: category, userId: userId);
    } catch (e) {
      showSnack(context: context, responseMessage: "Film eklenemiyor.");
    }
    showSnack(context: context, responseMessage: "Film başarıyla eklendi");

    notifyListeners();
  }

  Future<void> editMovie(Movie newMovie, BuildContext context) async {
    if (newMovie.userId == null ||
        newMovie.name == null ||
        newMovie.name == "" ||
        newMovie.category == null ||
        context == null) {
      showSnack(context: context, responseMessage: "Tüm alanları doldurun.");
      return;
    }

    try {
      await MockServer().updateMovie(newMovie);
    } catch (e) {
      showSnack(context: context, responseMessage: "Film güncellenemiyor.");
    }
    showSnack(context: context, responseMessage: "Film başarıyla güncellendi");

    notifyListeners();
  }

  Future<void> deleteMovie({Movie movie, BuildContext context}) async {
     if(movie.id == null){
       showSnack(context: context, responseMessage: "Film silinemez.");
     }

     try {
       await MockServer().deleteMovie(movie.id);
     } catch (e) {
       showSnack(context: context, responseMessage: "Film silinemedi.");
     }
     showSnack(context: context, responseMessage: "Film başarıyla silindi");

     notifyListeners();
  }
}
