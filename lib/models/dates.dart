import 'package:flutter/material.dart';

class Dates
{
  String? max;
  String? min;
  Dates({
    @required this.max,
    @required this.min,
  });

  Dates.fromJson(Map<String, dynamic> json){
    max= json['maximum'];
    min = json['minimum'];

  }
}