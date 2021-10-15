
import 'package:flutter/material.dart';
import 'package:movieapp/constants/constants.dart';

void printDebug(String message){
  if(debugLock){
    print("MovieApp Debug: "+ message);
  }
}

void showSnack({String responseMessage,BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text( responseMessage),
  ));
}
