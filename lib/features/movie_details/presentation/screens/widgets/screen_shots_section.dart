import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/resources/app_constants.dart';
import '../../../../../core/resources/strings_Manager.dart';

class ScreenShotsSection extends StatelessWidget {
  final List<String> images;

  const ScreenShotsSection({super.key, required this.images});

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
          padding: REdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: REdgeInsets.only(bottom: 10),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl: images[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          LoadingAnimationWidget.fourRotatingDots(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            size: 30.h,
                          ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error,
                          size: 30.sp,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              childCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}
