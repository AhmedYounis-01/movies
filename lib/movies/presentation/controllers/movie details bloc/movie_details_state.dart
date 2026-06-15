part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.message = '',
  });
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String message;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? message,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [movieDetails, movieDetailsState, message];
}
