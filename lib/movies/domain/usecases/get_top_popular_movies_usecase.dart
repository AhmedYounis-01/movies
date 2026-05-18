import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetTopPopularMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetTopPopularMoviesUsecase(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
