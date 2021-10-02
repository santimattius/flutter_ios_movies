import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ios_movies/home/upcoming/movies/presentation/bloc/up_coming_movies_bloc.dart';
import 'package:flutter_ios_movies/home/upcoming/shared/presentation/up_coming_ui_model.dart';
import 'package:flutter_ios_movies/home/upcoming/shared/presentation/up_comping_item.dart';
import 'package:flutter_ios_movies/injection_container.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/loading_widget.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/message_display.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';

class UpComingMoviesPage extends StatelessWidget {
  const UpComingMoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UpComingMoviesBloc>(),
      child: BlocBuilder<UpComingMoviesBloc, UpComingMoviesState>(
        builder: (context, state) {
          return currentStateWidget(context, state);
        },
      ),
    );
  }

  Widget currentStateWidget(BuildContext context, UpComingMoviesState state) {
    if (state is Initial) {
      BlocProvider.of<UpComingMoviesBloc>(context).add(GetMoviesEvent());
      return Container();
    } else if (state is Empty) {
      return MessageDisplay(
        message: 'No result available!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      final tvShows = state.movies;
      return buildListView(tvShows);
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    } else {
      return Container();
    }
  }

  ListView buildListView(final List<Movie> movies) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          String releaseDateFormatted = _releaseDateFormatted(movie);
          final model = UpComingModel(movie.title, movie.overview,
              movie.posterPath, releaseDateFormatted);
          return UpComingItem(
            model: model,
          );
        });
  }

  String _releaseDateFormatted(Movie movie) {
    final releaseDate = movie.releaseDate;
    final day = releaseDate.day.toString();
    final month = releaseDate.month.toString().padLeft(2, '0');
    final year = releaseDate.year.toString();
    String releaseDateFormatted = "$day-$month-$year";
    return releaseDateFormatted;
  }
}
