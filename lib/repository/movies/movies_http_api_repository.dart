import 'package:bloc_rest_api_clean_arch/config/app_urls.dart';
import 'package:bloc_rest_api_clean_arch/data/network/network_services_api.dart';
import 'package:bloc_rest_api_clean_arch/model/movies/movies.dart';
import 'package:bloc_rest_api_clean_arch/repository/movies/movies_repository.dart';
import 'package:flutter/material.dart';

class MoviesHttpApiRepository implements MoviesRepository {
  final _apiServices = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getAPI(
      AppUrls.popularMoviesListEndPoint,
    );
    return MoviesModel.fromJson(response);
  }
}
