import 'dart:async';

import 'package:floor/floor.dart';
import 'package:movies_app/models/movies.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../utils/app_constants.dart';
import 'dao/movies_dao.dart';
part 'app_database.g.dart'; // the generated code will be there


/*Run the generator with flutter packages pub run build_runner build.
To automatically run it, whenever a file changes, use flutter packages pub run build_runner watch.*/


@Database(version: APP_DATABASE_VERSION,entities: [Movies])
abstract class AppDatabase extends FloorDatabase {
  MoviesDao get moviesDao;

}
