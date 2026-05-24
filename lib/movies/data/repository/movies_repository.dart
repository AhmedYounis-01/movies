import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

  class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;

  MoviesRepository({required this.baseMovieRemoteDatasource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDatasource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDatasource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMsgModel.statusMessage));
    }
  }
}
