import 'package:flutter_ios_movies/detail/shared/presentation/base_detail_page.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';

class TvShowDetailPage extends BaseDetailPage {
  final TvShow tvShow;

  TvShowDetailPage(this.tvShow) : super();

  @override
  String title() => tvShow.name;

  @override
  String description() => tvShow.overview;

  @override
  String poster() => tvShow.posterPath;
}
