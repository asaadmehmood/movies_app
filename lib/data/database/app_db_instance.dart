import 'package:movies_app/models/movies.dart';
import '../../utils/app_constants.dart';
import 'app_database.dart';

class AppDbInstance {
  Future<AppDatabase> getDbInstance() async {
    AppDatabase? databaseInstance;
    final database =
    $FloorAppDatabase.databaseBuilder(APP_DATABASE_NAME).build();
    await database.then((value) => {databaseInstance = value});
    return databaseInstance!;
  }

  Future<List<Movies>> getMoviesData() {
    return getDbInstance()
        .then((value) => value.moviesDao.findAllMovies());
  }

}
