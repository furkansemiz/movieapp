import 'package:flutter/material.dart';
import 'package:movieapp/mockServer/mockServer.dart';
import 'package:movieapp/mockServer/serverInterface.dart';
import 'package:movieapp/models/user.dart';
import 'package:movieapp/utils/debugTool.dart';

class UserManager extends ChangeNotifier {
  User user;

  static final UserManager _UserManager = UserManager._internal();

  factory UserManager() {
    return _UserManager;
  }

  UserManager._internal();

  Future<OperationResult> login(
      {String username, String pass, BuildContext context}) async {
    if (username == null || pass == null) {
      showSnack(context: context, responseMessage: "Hata: giriş yapılamadı");
      return OperationResult(success: false, message: "Giriş Yapılamadı");
    }

    ResultBundle res = await MockServer().login(username: username, pass: pass);

    if (res.user == null) {
      showSnack(context: context, responseMessage: res.errorMessage);
      return null;
    }
    user = res.user;

    notifyListeners();

    return user == null
        ? OperationResult(success: false, message: "Giriş Yapılamadı")
        : OperationResult(success: true, message: "Giriş Yapıldı");
  }

  Future<OperationResult> signUp(
      {String username, String pass, BuildContext context}) async {

    ResultBundle res = await MockServer().signUp(username: username, pass: pass);

    if (res.user == null) {
      showSnack(context: context, responseMessage: res.errorMessage);
      return OperationResult(success: false, message: "Giriş Yapılamadı");
    }

    user = res.user;

    notifyListeners();

    Navigator.pop(context);


    return user == null
        ? OperationResult(success: false, message: "Giriş Yapılamadı")
        : OperationResult(success: true, message: "Giriş Yapıldı");
  }

  Future<void> logout(BuildContext context) async {
    if (user == null) return;

    await MockServer().logout(username: user.username, pass: user.password);
    user = null;
    notifyListeners();
  }
}

class OperationResult {
  bool success;
  String message = "";

  OperationResult({this.success, this.message});
}
