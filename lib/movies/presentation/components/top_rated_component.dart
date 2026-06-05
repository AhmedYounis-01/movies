import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/constants/enums.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/dummy.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState ||
          previous.topRatedMovies != current.topRatedMovies,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    final movie = moviesList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(
                  state.topRatedMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
        }
      },
    );
  }
}
