import 'package:flutter_ios_movies/shared/error/exceptions.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/the_movie_db_datasource.dart';
import 'package:flutter_ios_movies/the_movie_db/data/models/tv_show_model.dart';
import 'package:flutter_ios_movies/the_movie_db/data/models/tvshow_page_response.dart';
import 'package:http/http.dart' as http;

abstract class TvShowRemoteDataSource {
  /// Calls the https://api.themoviedb.org/3/tv/popular endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TvShowModel>> getPopularTvShows();

  /// Calls the https://api.themoviedb.org/3/tv/top_rated endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<TvShowModel>> getTopRatedTvShows();
}

class TvShowRemoteDataSourceImpl extends TheMovieDBDataSource
    implements TvShowRemoteDataSource {
  TvShowRemoteDataSourceImpl({required http.Client client})
      : super(client: client);

  @override
  Future<List<TvShowModel>> getPopularTvShows() async {
    return _getTvShows(endpoint: 'tv/popular', queryParams: {});
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows() {
    return _getTvShows(endpoint: 'tv/top_rated', queryParams: {});
  }

  Future<List<TvShowModel>> _getTvShows(
      {required String endpoint,
      required Map<String, String> queryParams}) async {
    return tvShowPageFromJson(await fetch(endpoint: endpoint, queryParams: {}))
        .results;
  }
}
