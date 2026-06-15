import 'package:dio/dio.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_msg_model.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getMovieRecommendation(
    MovieRecommendationParameters parameters,
  );
}

class MovieRemoteDatasource extends BaseMovieRemoteDatasource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.getPopularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.getTopRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.movieDetailsPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
    MovieRecommendationParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstants.recommendationPath(parameters.movieId),
    );
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMsgModel: ErrorMsgModel.fromJson(response.data),
      );
    }
  }
}
