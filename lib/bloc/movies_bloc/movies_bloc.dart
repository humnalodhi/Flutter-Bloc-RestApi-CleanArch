import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/movies_bloc/movies_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/movies_bloc/movies_state.dart';
import 'package:bloc_rest_api_clean_arch/data/response/api_response.dart';
import 'package:bloc_rest_api_clean_arch/repository/movies/movies_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;

  MoviesBloc({
    required this.moviesRepository,
  }) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(
      MoviesFetched event, Emitter<MoviesState> emit) async {
    await moviesRepository.fetchMoviesList().then((value) {
      emit(
        state.copyWith(
          moviesList: ApiResponse.completed(value),
        ),
      );
    }).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            moviesList: ApiResponse.error(
              error.toString(),
            ),
          ),
        );
      },
    );
  }
}
