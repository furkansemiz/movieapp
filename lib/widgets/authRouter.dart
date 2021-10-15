import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/models/user.dart';
import 'package:movieapp/pages/homePage.dart';
import 'package:movieapp/pages/loginPage.dart';
import 'package:movieapp/pages/signUpPage.dart';
import 'package:provider/provider.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userManager = context.watch<UserManager>();

    if (userManager.user == null) {
      ///Kullanıcı çıkış yaptığında ilk sayfaya atmasını sağlıyor. Navigator'ün çökmeden kullanılmasını sağlıyor.
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.popUntil(context, ModalRoute.withName("/"));
      });
    }

    return Provider.of<UserManager>(context, listen: true).user == null
        ?  LoginPage()
        : HomePage();
  }
}
