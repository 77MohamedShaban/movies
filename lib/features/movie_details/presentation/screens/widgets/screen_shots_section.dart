import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_constants.dart';
import '../../../../../core/resources/strings_Manager.dart';

class ScreenShotsSection extends StatelessWidget {
  const ScreenShotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Title
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              StringsManager.screenShots,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),

        // List
        SliverPadding(
          padding: REdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 32,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: REdgeInsets.only(bottom: 10),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      AppConstants.dumiMovies[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              childCount: AppConstants.dumiMovies.length,
            ),
          ),
        ),
      ],
    );
  }
}