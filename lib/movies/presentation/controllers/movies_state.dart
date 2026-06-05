import 'package:equatable/equatable.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestStates popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestStates topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestStates.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestStates.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestStates.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStates? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestStates? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestStates? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}
