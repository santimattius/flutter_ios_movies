import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/bloc/popular_tv_shows_bloc.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/loading_widget.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/message_display.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';

import '../../../injection_container.dart';

class PopularTvPage extends BaseCupertinoPage {
  const PopularTvPage({
    Key? key,
  }) : super(key: key);

  @override
  String title() => 'Populars Tv Shows';

  @override
  Widget content(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: BlocProvider(
        create: (_) => sl<PopularTvShowsBloc>(),
        child: BlocBuilder<PopularTvShowsBloc, PopularTvShowsState>(
          builder: (context, state) {
            return currentStateWidget(context, state);
          },
        ),
      ),
    );
  }

  Widget currentStateWidget(BuildContext context, PopularTvShowsState state) {
    if (state is Init) {
      BlocProvider.of<PopularTvShowsBloc>(context).add(GetTvShowsEvent());
      return Container();
    } else if (state is Empty) {
      return MessageDisplay(
        message: 'No result available!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      final tvShows = state.tvShows;
      return gridView(tvShows);
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    } else {
      return Container();
    }
  }

  GridView gridView(final List<TvShow> tvShows) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.67),
        itemCount: tvShows.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = tvShows[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}"),
          );
        });
  }
}
