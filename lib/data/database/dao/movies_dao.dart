import 'package:floor/floor.dart';
import 'package:movies_app/models/movies.dart';

@dao
abstract class MoviesDao{
  @Query('SELECT * FROM movies')
  Future<List<Movies>> findAllMovies();

  @Query('SELECT * FROM movies where id = :id')
  Future<Movies?> findMovieWithId(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movies movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAllMovies(List<Movies> brands);

  @Query("delete from movies where id = :id")
  Future<void> deleteMovie(int id);

  @Query("delete from movies")
  Future<void> deleteAll();
}