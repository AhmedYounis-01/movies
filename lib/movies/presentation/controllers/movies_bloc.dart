import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetTopPopularMoviesUsecase getTopPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getTopPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    // Trigger initial data fetch when the bloc is created so the UI
    // transitions from the loading state to loaded/error accordingly.
    add(GetNowPlayingMoviesEvent());
    add(GetPopularMoviesEvent());
    add(GetTopRatedMoviesEvent());
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestStates.error,
          nowPlayingMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestStates.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestStates.error,
          topRatedMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(topRatedMovies: r, topRatedState: RequestStates.loaded),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopPopularMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestStates.error,
          popularMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(popularMovies: r, popularState: RequestStates.loaded),
      ),
    );
  }
}
