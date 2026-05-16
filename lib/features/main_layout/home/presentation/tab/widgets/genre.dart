import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/strings_Manager.dart';
import 'package:movies/core/reusable_component/movie_item.dart';

class Genre extends StatelessWidget {
  const Genre({super.key});

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
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4.w,
                  children: [
                    Text(
                      StringsManager.seeMore,
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall,
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
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: 150.w,
                child: MovieItem(
                  image: AppConstants.dumiMovies[index].image,
                  rate: AppConstants.dumiMovies[index].rate,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemCount: AppConstants.dumiMovies.length,
            ),
          ),
        ),
      ],
    );
  }
}
