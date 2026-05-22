import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetTopPopularMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetTopPopularMoviesUsecase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
