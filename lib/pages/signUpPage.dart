import 'package:flutter/material.dart';
import 'package:movieapp/managers/userManager.dart';
import 'package:movieapp/utils/validators.dart';
import 'package:movieapp/widgets/roundedButtonWidget.dart';
import 'package:movieapp/widgets/roundedInputField.dart';
import 'package:movieapp/widgets/roundedPasswordField.dart';

import 'homePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  String _user = "";
  String _pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mailPassSectionSingUp(),
            RoundedMyButton(
              text: 'Üye ol',
              press: () async {
                await UserManager().signUp(context: context,pass: _pass,username: _user);
              },
            ),
          ],
        ),
      ),
    );
  }

  mailPassSectionSingUp() {
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
                  _user = value;
                });
              },
            ),
            RoundedPasswordField(
              validator: (value) => passValidator(value),
              onChanged: (value) {
                setState(() {
                  _pass = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
