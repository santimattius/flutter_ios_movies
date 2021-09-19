import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ios_movies/home/popular_movies/presentation/bloc/popular_movies_bloc.dart';
import 'package:flutter_ios_movies/injection_container.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/loading_widget.dart';
import 'package:flutter_ios_movies/shared/presentation/widgets/message_display.dart';
import 'package:flutter_ios_movies/the_movie_db/domain/entities/movie.dart';

class PopularMoviesPage extends BaseCupertinoPage {
  const PopularMoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  String title() => 'Popular Movies';

  @override
  Widget content(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: BlocProvider(
        create: (_) => sl<PopularMoviesBloc>(),
        child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            return currentStateWidget(context, state);
          },
        ),
      ),
    );
  }

  Widget currentStateWidget(BuildContext context, PopularMoviesState state) {
    if (state is Init) {
      BlocProvider.of<PopularMoviesBloc>(context).add(GetMoviesEvent());
      return Container();
    } else if (state is Empty) {
      return MessageDisplay(
        message: 'No result available!',
      );
    } else if (state is Loading) {
      return LoadingWidget();
    } else if (state is Loaded) {
      final movies = state.movies;
      return gridView(movies);
    } else if (state is Error) {
      return MessageDisplay(
        message: state.message,
      );
    } else {
      return Container();
    }
  }

  GridView gridView(final List<Movie> movies) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.67
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}"),
          );
        });
  }
}
