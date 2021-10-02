import 'package:flutter_ios_movies/home/popular_movies/domain/get_popular_movies.dart';
import 'package:flutter_ios_movies/home/popular_movies/presentation/bloc/popular_movies_bloc.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/domain/get_popular_tv_shows.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/bloc/popular_tv_shows_bloc.dart';
import 'package:flutter_ios_movies/home/upcoming/movies/domain/get_upcoming_movies.dart';
import 'package:flutter_ios_movies/home/upcoming/movies/presentation/bloc/up_coming_movies_bloc.dart';
import 'package:flutter_ios_movies/shared/network/network_info.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/movies_remote_data_source.dart';
import 'package:flutter_ios_movies/the_movie_db/data/datasources/tv_show_remote_data_source.dart';
import 'package:flutter_ios_movies/the_movie_db/data/repositories/movies_repository_impl.dart';
import 'package:flutter_ios_movies/the_movie_db/data/repositories/tv_shows_repository_impl.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/movies_repository.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/repositories/tvshow_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  sl.registerFactory<PopularMoviesBloc>(
    () => PopularMoviesBloc(getPopularMovies: sl()),
  );
  sl.registerFactory<PopularTvShowsBloc>(
    () => PopularTvShowsBloc(getPopularTvShows: sl()),
  );
  sl.registerFactory<UpComingMoviesBloc>(
    () => UpComingMoviesBloc(getUpComingMovies: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetPopularMovies(sl()));
  sl.registerLazySingleton(() => GetUpComingMovies(sl()));
  sl.registerLazySingleton(() => GetPopularTvShows(sl()));

  // Repository
  sl.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<TvShowsRepository>(
    () => TvShowsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(client: sl<http.Client>()),
  );

  //! Share
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
