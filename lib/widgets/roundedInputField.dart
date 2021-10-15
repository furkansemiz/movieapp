import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/config/colors.dart';
import 'package:movieapp/widgets/textFieldContainer.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final autofillHint;
  final keyboardType;
  final validator;
  const RoundedInputField({
    Key key,
    @required  this.hintText,
    this.icon = Icons.person,
    @required  this.onChanged,
    @required  this.autofillHint,
    this.keyboardType=TextInputType.text,
    @required this.validator,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: widget.validator,
        textInputAction: TextInputAction.next,
        autofillHints: widget.autofillHint,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: widget.keyboardType ,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
