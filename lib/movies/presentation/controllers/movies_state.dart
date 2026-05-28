import 'package:equatable/equatable.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestStates.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object> get props => [nowPlayingMovies, nowPlayingState, nowPlayingMessage];
}
