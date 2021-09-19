part of 'popular_tv_shows_bloc.dart';

@immutable
abstract class PopularTvShowsEvent extends Equatable {
  final List<Object> _props;

  PopularTvShowsEvent([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class GetTvShowsEvent extends PopularTvShowsEvent {}
