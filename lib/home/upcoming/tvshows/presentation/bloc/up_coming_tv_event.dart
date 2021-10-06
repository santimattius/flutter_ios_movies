part of 'up_coming_tv_bloc.dart';

@immutable
abstract class UpComingTvShowsEvent extends Equatable {
  final List<Object> _props;

  UpComingTvShowsEvent([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class GetMoviesEvent extends UpComingTvShowsEvent {}
