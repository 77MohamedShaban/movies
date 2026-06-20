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
    if (movie == null) return const Scaffold(body: Center(child: Text("No Movie Data")));

    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            getIt<MovieDetailsCubit>()..getMovieDetails(movie!.id!, true, true),
        child: Scaffold(
          body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  // Intro Section
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 645.h,
                      child: IntroSection(
                        image: movie?.image ?? '',
                        title: movie?.title ?? '',
                        date: movie?.year.toString() ?? '',
                        movieId: movie!.id!,
                      ),
                    ),
                  ),

                  // Watch Button
                  SliverPadding(
                    padding: REdgeInsets.only(right: 16, left: 16, top: 16),
                    sliver: SliverToBoxAdapter(
                      child: MainBtn(
                        text: StringsManager.watch,
                        onClick: () async {
                          // إضافة الفيلم للسجل (History) في Firebase
                          context.read<MovieDetailsCubit>().addToHistory(movie!.id!);

                          final Uri url = Uri.parse(movie?.url ?? "");
                          await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                        },
                        redBackgroundColor: true,
                      ),
                    ),
                  ),

                  // Movie Details Body
                  if (state.detailsStatus == MovieDetailsStatus.loading)
                    SliverToBoxAdapter(
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          size: 60.h,
                        ),
                      ),
                    )
                  else if (state.detailsStatus == MovieDetailsStatus.success && state.movieDetails != null)
                    SliverMainAxisGroup(
                      slivers: [
                        SliverPadding(
                          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          sliver: SliverToBoxAdapter(
                            child: EvaluationSection(
                              rating: state.movieDetails!.movie?.rating.toString() ?? "",
                              runtime: state.movieDetails!.movie?.runtime.toString() ?? "",
                              votes: state.movieDetails!.movie?.likeCount.toString() ?? "",
                            ),
                          ),
                        ),

                        ScreenShotsSection(
                          images: [
                            state.movieDetails!.movie?.largeScreenshotImage1 ?? "",
                            state.movieDetails!.movie?.largeScreenshotImage2 ?? "",
                            state.movieDetails!.movie?.largeScreenshotImage3 ?? "",
                          ],
                        ),

                        // Similar Movies Section
                        if (state.similarStatus == SimilarMoviesStatus.loading)
                          SliverToBoxAdapter(
                            child: Center(
                              child: LoadingAnimationWidget.fourRotatingDots(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                                size: 60.h,
                              ),
                            ),
                          )
                        else if (state.similarStatus == SimilarMoviesStatus.success && state.similarMovies != null)
                          SimilarSection(movies: state.similarMovies!.movies)
                        else if (state.similarStatus == SimilarMoviesStatus.error)
                          SliverToBoxAdapter(
                            child: Center(child: Text(state.similarError ?? "Error loading similar movies")),
                          ),

                        SummarySection(summary: state.movieDetails!.movie?.descriptionFull ?? ""),
                        CastSection(cast: state.movieDetails!.movie?.cast ?? []),
                        GenresSection(genres: state.movieDetails!.movie?.genres ?? []),
                      ],
                    )
                  else if (state.detailsStatus == MovieDetailsStatus.error)
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50.h),
                          Text(state.detailsError ?? "Error loading details"),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
