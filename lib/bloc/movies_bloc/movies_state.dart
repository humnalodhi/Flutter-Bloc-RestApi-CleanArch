import 'package:bloc_rest_api_clean_arch/data/response/api_response.dart';
import 'package:bloc_rest_api_clean_arch/model/movies/movies.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  const MoviesState({
    required this.moviesList,
  });

  final ApiResponse<MoviesModel> moviesList;

  MoviesState copyWith({
    ApiResponse<MoviesModel>? moviesList,
  }) {
    return MoviesState(
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [moviesList];
}
