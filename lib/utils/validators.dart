String emptyValidator(value){
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

String mailValidator (email){
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  if(email == null || email.isEmpty || !emailValid){
    return "Hatalı email formatı";
  }
  return null;
}

String passValidator(String value){
  if (value == null || value.isEmpty ) {
    return "Hatalı şifre formatı";
  }

  if( value.length < 6)
    return "Şifre 6 haneden uzun olmalıdır";

  return null;
}