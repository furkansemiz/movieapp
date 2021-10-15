import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/config/colors.dart';
import 'package:movieapp/widgets/textFieldContainer.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final callback;
  final validator;

  RoundedPasswordField({
    Key key,
    @required this.onChanged,
    @required this.callback,
    @required this.validator
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: widget.validator,
        obscureText: hide,
        textInputAction:  TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Şifre",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                hide = !hide;
              });
            },
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}