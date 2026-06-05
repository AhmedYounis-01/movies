import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //! BLOCS
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    //! USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopPopularMoviesUsecase(sl()));

    //! REPOSITORIES
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    //! DATA SOURCES
    sl.registerLazySingleton<BaseMovieRemoteDatasource>(
      () => MovieRemoteDatasource(),
    );
  }
}
