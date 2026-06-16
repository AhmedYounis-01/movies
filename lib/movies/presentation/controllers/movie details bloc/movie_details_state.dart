part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.message = '',
    this.recommendation = const [],
    this.recommendationState = RequestStates.loading,
    this.recommendationMessage = '',
  });
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String message;
  final List<Recommendation> recommendation;
  final RequestStates recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? message,
    List<Recommendation>? recommendation,
    RequestStates? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    message,
    recommendation,
    recommendationState,
    recommendationMessage,
  ];
}
