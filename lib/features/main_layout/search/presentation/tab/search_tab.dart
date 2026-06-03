import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/custom_field.dart';
import 'package:movies/core/reusable_component/movie_item.dart';

import '../view_models/search_cubit.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;
  late ScrollController scrollController;
  @override
  void initState() {
    searchController = TextEditingController();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.9) {
        if (searchController.text.isNotEmpty) {
          context.read<SearchCubit>().searchMovie(
            searchController.text.trim(),
            isLoadMore: true,
          );
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: REdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          spacing: 16.h,
          children: [
            CustomField(
              controller: searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              hintText: StringsManager.search,
              prefixPath: AssetsManager.searchIcon,
              onSubmitted: (value) {
                context.read<SearchCubit>().searchMovie(value.trim());
              },
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(
                      child: Lottie.asset(AssetsManager.searchLottie,height: 300.h,width: 300.w),
                    );
                  }
                  if (state is SearchLoading) {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 60.h,
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        topLeft: Radius.circular(16.r),
                      ),
                      child: GridView.builder(
                        controller: scrollController,
                        itemCount: state.searchMovieEntity.movies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8,
                              childAspectRatio: .75,
                            ),
                        itemBuilder: (context, index) {
                          final movie = state.searchMovieEntity.movies[index];
                          return MovieItem(
                            image: movie.largeCoverImage,
                            title: movie.title,
                            year: movie.year.toString(),
                            rate: movie.rating.toString(),
                            id: movie.id,
                            url: movie.url,
                          );
                        },
                        padding: REdgeInsets.only(bottom: 100),
                      ),
                    );
                  }
                  if (state is SearchFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                       spacing: 20.h,
                        children: [
                          Text(
                            state.message,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Lottie.asset(AssetsManager.noResultLottie,height: 200.h,width: 200.w)
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
