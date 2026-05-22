class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = "1b19c1640a7f2d9d17c6647308a2153f";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getPopularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
}
