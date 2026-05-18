import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUsecase(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
