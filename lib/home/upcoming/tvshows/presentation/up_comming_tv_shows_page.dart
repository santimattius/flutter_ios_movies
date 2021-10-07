import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ios_movies/detail/tvshow/presentation/tv_show_detail_page.dart';
import 'package:flutter_ios_movies/home/upcoming/shared/presentation/up_coming_ui_model.dart';
import 'package:flutter_ios_movies/home/upcoming/shared/presentation/up_comping_item.dart';
import 'package:flutter_ios_movies/home/upcoming/tvshows/presentation/bloc/up_coming_tv_bloc.dart';
import 'package:flutter_ios_movies/injection_container.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/loading_widget.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/message_display.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/tv_show.dart';

class UpComingTvShowsPage extends StatelessWidget {
  const UpComingTvShowsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UpComingTvShowsBloc>(),
      child: BlocBuilder<UpComingTvShowsBloc, UpComingTvShowsState>(
        builder: (context, state) {
          return currentStateWidget(context, state);
        },
      ),
    );
  }

  Widget currentStateWidget(BuildContext context, UpComingTvShowsState state) {
    if (state is Initial) {
      BlocProvider.of<UpComingTvShowsBloc>(context).add(GetMoviesEvent());
      return Container();
    } else if (state is Empty) {
      return MessageDisplay(
        message: 'No result available!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      final tvShows = state.tvShows;
      return buildListView(tvShows);
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    } else {
      return Container();
    }
  }

  ListView buildListView(final List<TvShow> tvShows) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tvShows.length,
        itemBuilder: (BuildContext context, int index) {
          final tvShow = tvShows[index];
          final model = UpComingModel(
            title: tvShow.name,
            description: tvShow.overview,
            image: tvShow.posterPath,
          );
          return UpComingItem(
              model: model,
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => TvShowDetailPage(tvShow)));
              });
        });
  }
}
