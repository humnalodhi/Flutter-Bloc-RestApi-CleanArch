import 'package:bloc_rest_api_clean_arch/model/movies/movies.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}
