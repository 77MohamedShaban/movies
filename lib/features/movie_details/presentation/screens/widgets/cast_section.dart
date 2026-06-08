import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies/features/movie_details/data/model/movie_details_model.dart';
import '../../../../../core/resources/strings_Manager.dart';

class CastSection extends StatelessWidget {
  final List<Cast> cast;

  const CastSection({super.key, required this.cast});

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
                  height: 120.h,
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
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: cast[index].urlSmallImage ?? "",
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(
                                    child: LoadingAnimationWidget.staggeredDotsWave(
                                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                                      size: 30.sp,
                                    ),
                                  ),
                              errorWidget: (context, url, error) => Center(
                                child: Icon(
                                  Icons.error,
                                  size: 15.sp,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${StringsManager.name} : ${cast[index].name}",
                                style: Theme.of(context).textTheme.labelSmall,
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${StringsManager.character} : ${cast[index].characterName}",
                                style: Theme.of(context).textTheme.labelSmall,
                                softWrap: true,
                                maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              childCount: cast.length,
            ),
          ),
        ),
      ],
    );
  }
}
