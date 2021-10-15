import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movieapp/constants/constants.dart';
import 'package:movieapp/mockServer/serverInterface.dart';
import 'package:movieapp/models/category.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/save_file.dart';
import 'package:movieapp/models/user.dart';
import 'package:collection/collection.dart';
import 'package:movieapp/utils/debugTool.dart';

class MockServer implements Server {
  List<Category> categories;

  List<Movie> movies;

  List<User> users;

  List<User> activeUsers = [];

  SaveFile saveFile;

  bool initialized = false;

  final storage = new FlutterSecureStorage();

  ///Yeni obje oluşturmadan bir örneği yapılandırıp sürekli aynı objeyi çağırıyoruz
  static final MockServer _mockServer = MockServer._internal();

  factory MockServer() {
    return _mockServer;
  }

  MockServer._internal();

  @override
  Future<void> initializeServer() async {
    try {
      saveFile =
          SaveFile.fromJson(jsonDecode(await storage.read(key: "DBSAVE")));
    } catch (e) {
      await storage.write(key: "DBSAVE", value: mockData);
      saveFile = SaveFile.fromJson(jsonDecode(mockData));
    }
    if (saveFile != null) {
      categories = saveFile.categories;
      movies = saveFile.movies;
      users = saveFile.users;
    } else {
      print("Veriler düzgün şekilde okunamadı");
      categories = [];
      movies = [];
      users = [];
    }
    initialized = true;
  }

  Future<void> saveDB() async {
    await storage.write(key: "DBSAVE", value: jsonEncode(saveFile));
  }

  @override
  Future<void> addMovie({int userId, String name, Category category}) async {

    if(movies == null){
      movies.add(Movie(
          userId: userId, category: category, name: name, id: getMovieId()));
    }
    movies.add(Movie(
        userId: userId, category: category, name: name, id: getMovieId()));
    await saveDB();
  }

  @override
  Future<void> deleteMovie(int id) async {
    movies.remove(movies.firstWhere((element) => element.id == id));
    await saveDB();
  }

  @override
  Future<List<Movie>> getMovies() async {
    return movies;
  }

  @override
  Future<List<Category>> getCategories() async {
    return categories;
  }

  @override
  Future<ResultBundle> login({String username, String pass}) async {
    printDebug("login gelen user pass: " + username + ":" + pass);

    var temp =
        users.firstWhereOrNull((element) => element.username == username);
    if (username == "" || pass == "") {
      return ResultBundle(null, "Alanlar boş.");
    }

    if (temp == null) {
      return ResultBundle(null, "Böyle bir hesap yok");
    }
    if (temp.password != pass) {
      return ResultBundle(null, "Yanlış şifre");
    }

    activeUsers.add(temp);
    return ResultBundle(temp, "");
  }

  @override
  Future<void> logout({String username, String pass}) async {
    activeUsers.remove(await login(username: username, pass: pass));
  }

  @override
  Future<ResultBundle> signUp({String username, String pass}) async {
    var temp =
        users.firstWhereOrNull((element) => element.username == username);


    if (username == "" || pass == "") {
      return ResultBundle(null, "Alanlar boş.");
    }

    if (temp != null) {
      return ResultBundle(null, "Kullanıcı adı kullanımda.");
    }

    if (pass.length < 6) {
      return ResultBundle(null, "Şifre 6 haneden uzun olmalıdır.");
    }
    var user = User(username: username, password: pass, id: getid());
    users.add(user);
    await saveDB();
    return ResultBundle(user, "");
  }

  int getid() {
    users.sort((a, b) => a.id.compareTo(b.id));
    return users.last.id + 1;
  }

  int getMovieId() {
    if(movies.isEmpty){
      return 1;
    }
    movies.sort((a, b) => a.id.compareTo(b.id));
    return movies.last.id + 1;
  }

  @override
  Future<void> updateMovie(Movie newMovie) async {
    var temp = movies.firstWhereOrNull((element) => element.id == newMovie.id);
    if (temp == null) return;

    movies.remove(temp);
    movies.add(newMovie);

    await saveDB();
  }
}
