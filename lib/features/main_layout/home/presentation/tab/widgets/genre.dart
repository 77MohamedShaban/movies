import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/strings_Manager.dart';

import '../../../../../../core/reusable_component/movie_item.dart';
import '../../view_models/home_cubit.dart';

class Genre extends StatelessWidget {
  final Function(int) onClickSeeMore;

  const Genre({super.key, required this.onClickSeeMore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Action", style: Theme.of(context).textTheme.bodySmall),
              GestureDetector(
                onTap: () => onClickSeeMore(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4.w,
                  children: [
                    Text(
                      StringsManager.seeMore,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: REdgeInsets.only(left: 16, top: 16, bottom: 16),
          child: SizedBox(
            height: 220.h,
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is MoviesGenresSuccessState ||
                  current is MoviesGenresLoadingState ||
                  current is MoviesGenresErrorState,
              builder: (context, state) {
                if (state is MoviesGenresLoadingState) {
                  return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 60.h,
                    ),
                  );
                } else if (state is MoviesGenresSuccessState) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      width: 150.w,
                      child: MovieItem(
                        image: state.data.movies[index].largeCoverImage,
                        rate: state.data.movies[index].rating.toString(),
                        title: state.data.movies[index].title,
                        year: state.data.movies[index].year.toString(),
                        id: state.data.movies[index].id, url: state.data.movies[index].url,
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 16.w),
                    itemCount: state.data.movies.length,
                  );
                } else if (state is MoviesGenresErrorState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16.h,
                    children: [
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
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ],
    );
  }
}
