import 'package:dio/dio.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_msg_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

class MovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      '${Constants.baseUrl}/movie/now_playing?api_key=${Constants.apiKey}',
    );
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
}
