import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    BaseMovieRemoteDatasource movieRemoteDatasource = MovieRemoteDatasource();
    BaseMovieRepository movieRepository = MoviesRepository(
      baseMovieRemoteDatasource: movieRemoteDatasource,
    );
    final result = await GetNowPlayingMoviesUsecase(movieRepository).execute();
    print(result);
  }
}
