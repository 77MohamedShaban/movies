import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../view_models/movie_details_cubit.dart';

class IntroSection extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final int movieId;

  const IntroSection({
    required this.image,
    required this.title,
    required this.date,
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: image != ''
            ? DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              Theme.of(context).colorScheme.primary,
            ],
            stops: const [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: REdgeInsets.only(top: 30, left: 20, right: 20, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                    buildWhen: (prev, curr) => prev.isWatchlisted != curr.isWatchlisted,
                    builder: (context, state) {
                      final bool isWatchlisted = state.isWatchlisted;
                      return GestureDetector(
                        onTap: () {
                          context.read<MovieDetailsCubit>().toggleWatchlist(movieId);
                        },
                        child: Icon(
                          isWatchlisted ? Icons.bookmark : Icons.bookmark_border_rounded,
                          color: isWatchlisted
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onPrimary,
                          size: 30.sp,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Image.asset(AssetsManager.playVideoIcon, height: 97.h),
              Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.gray,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
