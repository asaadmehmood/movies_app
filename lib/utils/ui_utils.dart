import 'package:flutter/material.dart';

class Ui {

  static String checkNullString(bool prefix) {
    var debug = false;
    var value = '';
    if (debug) {
      if (prefix) {
        value = ',N/A';
      } else {
        value = 'N/A';
      }
    }
    return value;
  }

}
