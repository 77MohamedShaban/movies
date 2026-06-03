import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/main_btn.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/cast_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/evaluation_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/genres_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/intro_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/screen_shots_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/similar_section.dart';
import 'package:movies/features/movie_details/presentation/screens/widgets/summary_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/models/movie.dart';
import '../view_models/movie_details_cubit.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Movie? movie;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movie = ModalRoute.of(context)?.settings.arguments as Movie?;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            getIt<MovieDetailsCubit>()..getMovieDetails(movie!.id!, true, true),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              // Intro
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 645.h,
                  child: IntroSection(
                    image: movie?.image ?? '',
                    title: movie?.title ?? '',
                    date: movie?.year.toString() ?? '',
                  ),
                ),
              ),

              // Watch Button
              SliverPadding(
                padding: REdgeInsets.only(right: 16, left: 16, top: 16),
                sliver: SliverToBoxAdapter(
                  child: MainBtn(
                    text: StringsManager.watch,
                    onClick: () async{
                      final Uri url = Uri.parse(movie?.url ?? "");
                      await launchUrl(url,mode: LaunchMode.inAppBrowserView);
                    },
                    redBackgroundColor: true,
                  ),
                ),
              ),

              BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                buildWhen: (previous, current) =>
                    current is MovieDetailsSuccess ||
                    current is MovieDetailsFailure ||
                    current is MovieDetailsLoading,
                builder: (context, state) {
                  if (state is MovieDetailsLoading) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                          size: 60.h,
                        ),
                      ),
                    );
                  } else if (state is MovieDetailsSuccess) {
                    return SliverMainAxisGroup(
                      slivers: [
                        // Evaluation
                        SliverPadding(
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          sliver: SliverToBoxAdapter(
                            child: EvaluationSection(
                              rating:
                                  state.movieDetails.movie?.rating.toString() ??
                                  "",
                              runtime:
                                  state.movieDetails.movie?.runtime
                                      .toString() ??
                                  "",
                              votes:
                                  state.movieDetails.movie?.likeCount
                                      .toString() ??
                                  "",
                            ),
                          ),
                        ),

                        ScreenShotsSection(
                          images: [
                            state.movieDetails.movie?.largeScreenshotImage1 ??
                                "",
                            state.movieDetails.movie?.largeScreenshotImage2 ??
                                "",
                            state.movieDetails.movie?.largeScreenshotImage3 ??
                                "",
                          ],
                        ),
                        BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                          buildWhen: (previous, current) =>
                              current is SimilarMoviesSuccess ||
                              current is SimilarMoviesFailure ||
                              current is SimilarMoviesLoading,
                          builder: (context, state) {
                            if (state is SimilarMoviesLoading) {
                              return SliverToBoxAdapter(
                                child: Center(
                                  child:
                                      LoadingAnimationWidget.fourRotatingDots(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                        size: 60.h,
                                      ),
                                ),
                              );
                            } else if (state is SimilarMoviesSuccess) {
                              return SimilarSection( movies: state.similarMovies.movies,);
                            } else if (state is SimilarMoviesFailure) {
                              return SliverToBoxAdapter(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 16.h,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text(
                                      state.message,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    Icon(
                                      Icons.error,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      size: 50.h,
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                        SummarySection(
                          summary:
                              state.movieDetails.movie?.descriptionFull ?? "",
                        ),
                        CastSection(cast: state.movieDetails.movie?.cast ?? []),
                        GenresSection(
                          genres: state.movieDetails.movie?.genres ?? [],
                        ),
                      ],
                    );
                  } else if (state is MovieDetailsFailure) {
                    return SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16.h,
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            state.message,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Icon(
                            Icons.error,
                            color: Theme.of(context).colorScheme.error,
                            size: 50.h,
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
