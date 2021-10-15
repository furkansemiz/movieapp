import 'package:flutter/material.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/pages/signUpPage.dart';
import 'package:movieapp/utils/validators.dart';
import 'package:movieapp/widgets/roundedButtonWidget.dart';
import 'package:movieapp/widgets/roundedInputField.dart';
import 'package:movieapp/widgets/roundedPasswordField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mailPassSection(),
          RoundedMyButton(
            text: 'Giriş yap',
            press: () async {
              await UserManager().login(context: context,pass: _pass,username: _username);
            },
          ),
          RoundedMyButton(
            text: 'Üye ol',
            press: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
        ],
      ),),
    );
  }

  mailPassSection() {
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            RoundedInputField(
              validator: (value) => mailValidator(value),
              hintText: "Kullanıcı adı",
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            RoundedPasswordField(
              validator: (value) => passValidator(value),
              onChanged: (value) {
                _pass = value;
              },
            )
          ],
        ),
      ),
    );
  }

}
