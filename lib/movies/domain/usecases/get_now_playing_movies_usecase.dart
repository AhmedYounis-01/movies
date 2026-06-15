import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
