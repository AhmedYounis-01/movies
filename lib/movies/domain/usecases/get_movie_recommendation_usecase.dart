import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, MovieRecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieRecommendationUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
    MovieRecommendationParameters parameters,
  ) async {
    return await baseMovieRepository.getMovieRecommendation(parameters);
  }
}

class MovieRecommendationParameters extends Equatable {
  final int movieId;

  const MovieRecommendationParameters(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
