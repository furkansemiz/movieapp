import 'package:movieapp/models/category.dart';
import 'package:movieapp/models/user.dart';

import '../models/movie.dart';

/// Server interface'i birden çok sunucu çözümü arasında geçiş yapabilmeyi kolaylaştırmak için eklenmiştir.
/// Bu projede sahte bir sunucu kullanıldı fakat bu arayüzle oluşturulan başka bir serverManager sınıfı gerçek bir sunucu ile bu işlemleri
/// gerçekleştirebilir.
abstract class Server {
  Future<ResultBundle> login({String username, String pass});

  Future<ResultBundle> signUp({String username, String pass});

  Future<void> logout({String username, String pass});

  Future<List<Movie>> getMovies();

  Future<List<Category>> getCategories();

  Future<void> addMovie({int userId, String name, Category category});

  Future<void> updateMovie(Movie newMovie);

  Future<void> deleteMovie(int id);

  Future<void> initializeServer();
}


class ResultBundle{
  User user;
  String errorMessage;

  ResultBundle(this.user, this.errorMessage);

}
