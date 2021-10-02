part of 'up_coming_movies_bloc.dart';

@immutable
abstract class UpComingMoviesEvent extends Equatable {
  final List<Object> _props;

  UpComingMoviesEvent([this._props = const <Object>[]]) : super();

  @override
  List<Object> get props => _props;
}

class GetMoviesEvent extends UpComingMoviesEvent {}
