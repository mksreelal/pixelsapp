import 'package:flutter/foundation.dart';

class PrintString{
  final dynamic data;

  PrintString(this.data){
   printString(data);
  }
  void printString(data){
    if (kDebugMode) {
      print(data);
    }
  }
}