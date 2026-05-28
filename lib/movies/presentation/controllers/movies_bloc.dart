import 'package:bloc/bloc.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      emit(const MoviesState(nowPlayingState: RequestStates.loaded));
      print(result);
      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingState: RequestStates.error,
            nowPlayingMessage: l.errMessage,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            nowPlayingState: RequestStates.loaded,
          ),
        ),
      );
    });
  }
}
