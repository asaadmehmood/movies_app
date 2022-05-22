import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity(tableName: 'movies')
class Movies {
  @PrimaryKey(autoGenerate: false)
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  bool? video;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  String? backdropPath;
  bool? adult;

  Movies({
    @required this.id,
    @required this.adult,
    @required this.originalTitle,
    @required this.originalLanguage,
    @required this.popularity,
    @required this.posterPath,
    @required this.releaseDate,
    @required this.overview,
    @required this.video,
    @required this.voteAverage,
    @required this.voteCount,
    @required this.backdropPath,
  });

  Movies.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
//    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
//    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    backdropPath = json['backdrop_path'];
  }
}