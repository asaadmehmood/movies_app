import 'package:flutter/material.dart';
import 'package:movies_app/models/dates.dart';
import 'package:movies_app/models/movies.dart';

class SeverResponse {
  Dates? dates;
  int? page;
  int? total_pages;
  int? total_results;
  List<Movies>? results;


  SeverResponse({
    @required this.dates,
    @required this.results,
    @required this.total_pages,
    @required this.total_results,
    @required this.page,
  });

  SeverResponse.fromJson(Map<String, dynamic> json){
    dates = Dates.fromJson(json['dates']);
    total_pages = json['total_pages'];
    page =json['page'];
    total_results =json['total_results'];
    results =json['results'].map<Movies>((
        json) {
      return Movies.fromJson(json);
    }).toList();

  }
}