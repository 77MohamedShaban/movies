import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_constants.dart';
import '../../../../../core/resources/strings_Manager.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Cast Title
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              StringsManager.cast,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        // Cast SliverList
        SliverPadding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: REdgeInsets.only(bottom: 8),
                child: SizedBox(
                  height: 100.h,
                  child: Container(
                    padding: REdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppConstants.dumiMovies[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${StringsManager.name} : Hayley Atwell",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              "${StringsManager.character} : Christine Palmer",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              childCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}
