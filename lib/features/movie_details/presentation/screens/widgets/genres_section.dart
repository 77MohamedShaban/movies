import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/strings_Manager.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;
  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        // Genres Title
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              StringsManager.genres,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        // Genres Wrap
        SliverPadding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 16, bottom: 50),
          sliver: SliverToBoxAdapter(
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: List.generate(genres.length, (index) {
                return Container(
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    genres[index],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
