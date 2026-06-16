import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailsUsecase,
    this.getMovieRecommendationsUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecommendationUsecase getMovieRecommendationsUsecase;

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUsecase.call(
      MovieDetailsParameters(event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestStates.error,
          message: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestStates.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetMovieRecommendationEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieRecommendationsUsecase.call(
      MovieRecommendationParameters(event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestStates.error,
          recommendationMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestStates.loaded,
        ),
      ),
    );
  }
}
