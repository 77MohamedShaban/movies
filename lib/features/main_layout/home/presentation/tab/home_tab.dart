import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/reusable_component/movie_item.dart';
import 'package:movies/features/main_layout/home/presentation/tab/widgets/genre.dart';
import 'package:movies/features/main_layout/home/presentation/view_models/home_cubit.dart';

class HomeTab extends StatefulWidget {
  final Function(int) onClickSeeMore;

  const HomeTab({super.key, required this.onClickSeeMore});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late int selectedMovie;
  late final PageController pageController;

  @override
  void initState() {
    selectedMovie = 0;
    pageController = PageController(viewportFraction: 0.6);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 650.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is MoviesSuccessState ||
                    current is MoviesLoadingState,
                builder: (context, state) {
                  String? backgroundImage;
                  if (state is MoviesLoadingState) {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 60.h,
                      ),
                    );
                  }
                  if (state is MoviesSuccessState &&
                      state.data.movies != [] &&
                      state.data.movies.isNotEmpty) {
                    backgroundImage =
                        state.data.movies[selectedMovie].largeCoverImage;
        
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(backgroundImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.8),
                              Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.6),
                              Theme.of(context).colorScheme.primary,
                            ],
                            stops: const [0, .47, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: REdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AssetsManager.availableNow,
                                height: 93.h,
                              ),
                              Expanded(
                                child: BlocBuilder<HomeCubit, HomeState>(
                                  buildWhen: (previous, current) =>
                                      current is MoviesSuccessState ||
                                      current is MoviesLoadingState ||
                                      current is MoviesErrorState,
                                  builder: (context, state) {
                                    if (state is MoviesLoadingState) {
                                      return Center(
                                        child:
                                            LoadingAnimationWidget.fourRotatingDots(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimaryContainer,
                                              size: 60.h,
                                            ),
                                      );
                                    } else if (state is MoviesSuccessState) {
                                      final movies = state.data.movies ?? [];
                                      return PageView.builder(
                                        controller: pageController,
                                        itemCount: movies.length,
                                        onPageChanged: (index) {
                                          setState(() => selectedMovie = index);
        
                                          // Pagination Logic:
                                          if (index >= movies.length - 3) {
                                            context
                                                .read<HomeCubit>()
                                                .fetchMovies();
                                          }
                                        },
                                        itemBuilder: (context, index) {
                                          final isSelected =
                                              selectedMovie == index;
                                          final movie = movies[index];
        
                                          return GestureDetector(
                                            onTap: () {
                                              pageController.animateToPage(
                                                index,
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                vertical: isSelected ? 0 : 5.h,
                                              ),
                                              child: AnimatedScale(
                                                scale: isSelected ? 1 : 0.8,
                                                duration: const Duration(
                                                  milliseconds: 600,
                                                ),
                                                curve: Curves.easeOutCubic,
                                                child: MovieItem(
                                                  image: movie.largeCoverImage,
                                                  rate: movie.rating.toString(),
                                                  title: movie.title,
                                                  year: movie.year.toString(),
                                                  id: movie.id,
                                                  url: movie.url,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else if (state is MoviesErrorState) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 16.h,
                                        children: [
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
                                      );
                                    }
                                    return Container();
                                  },
                                ),
                              ),
                              Image.asset(
                                AssetsManager.watchNow,
                                height: 140.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            Genre(onClickSeeMore: widget.onClickSeeMore),
          ],
        ),
      ),
    );
  }
}
