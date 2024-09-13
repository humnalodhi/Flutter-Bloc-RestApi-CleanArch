import 'package:bloc_rest_api_clean_arch/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloc_rest_api_clean_arch/bloc/movies_bloc/movies_event.dart';
import 'package:bloc_rest_api_clean_arch/bloc/movies_bloc/movies_state.dart';
import 'package:bloc_rest_api_clean_arch/main.dart';
import 'package:bloc_rest_api_clean_arch/utils/components/internet_exception_widget.dart';
import 'package:bloc_rest_api_clean_arch/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    moviesBloc = MoviesBloc(
      moviesRepository: getIt(),
    );
    super.initState();
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: BlocProvider(
        create: (_) => moviesBloc
          ..add(
            MoviesFetched(),
          ),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.completed:
                if (state.moviesList.data == null) {
                  return const Text('No Data Found');
                }
                final movieList = state.moviesList.data!;
                return ListView.builder(
                  itemCount: movieList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movieList.tvShow[index];
                    return Card(
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage(
                            tvShow.imageThumbnailPath,
                          ),
                        ),
                        title: Text(
                          tvShow.name.toString(),
                        ),
                        subtitle: Text(
                          tvShow.network.toString(),
                        ),
                        trailing: Text(
                          tvShow.status.toString(),
                        ),
                      ),
                    );
                  },
                );
              case Status.error:
                if (state.moviesList.message == 'No Internet Connection!') {
                  return InternetExceptionWidget(
                    onPress: () {
                      moviesBloc.add(
                        MoviesFetched(),
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                    state.moviesList.message.toString(),
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
