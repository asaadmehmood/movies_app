import 'package:flutter/cupertino.dart';
import 'package:movies_app/data/network/api_service.dart';
import 'package:movies_app/models/movies.dart';

class MoviesProvider extends ChangeNotifier{

  List<Movies> moviesList = [];
  bool loading = false;

  getMoviesData() async{
    loading = true;
    var response = await ApiService.movies();
    moviesList = response.results!;
    loading = false;
    notifyListeners();
  }

}