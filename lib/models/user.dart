

class User {
  int _id;
  String _username;
  String _password;

  int get id => _id;
  String get username => _username;
  String get password => _password;

  User({
      int id, 
      String username, 
      String password}){
    _id = id;
    _username = username;
    _password = password;
}

  User.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["username"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

}