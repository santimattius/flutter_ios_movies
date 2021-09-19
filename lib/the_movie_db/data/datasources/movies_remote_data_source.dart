import 'package:flutter_ios_movies/shared/error/exceptions.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/the_movie_db_datasource.dart';
import 'package:flutter_ios_movies/the_movie_db/data/models/movie_model.dart';
import 'package:flutter_ios_movies/the_movie_db/data/models/movie_page_response.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  /// Calls the https://api.themoviedb.org/3/movie/popular endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getPopularMovies();
}

class MoviesRemoteDataSourceImpl extends TheMovieDBDataSource
    implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({required http.Client client})
      : super(client: client);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    return _getMovies(endpoint: 'movie/popular', queryParams: {});
  }

  Future<List<MovieModel>> _getMovies(
      {required String endpoint,
      required Map<String, String> queryParams}) async {
    queryParams['api_key'] = 'ee6fa3652297841e02d5808229a45d6d';
    final url = Uri.https(BASE_URL, '/3/$endpoint', queryParams);
    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return moviePageFromJson(response.body).results;
    } else {
      throw ServerException();
    }
  }

  static const BASE_URL = "api.themoviedb.org";
}
