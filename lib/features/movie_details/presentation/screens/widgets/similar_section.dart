import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/strings_Manager.dart';
import '../../../../../core/reusable_component/movie_item.dart';
import '../../../data/model/similar_movies_response.dart';

class SimilarSection extends StatelessWidget {
  final List<Movie?> movies;

  const SimilarSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              StringsManager.similar,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverPadding(
          padding: REdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: .75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => MovieItem(
                id: movies[index]?.id ?? 0,
                image: movies[index]?.mediumCoverImage ?? "",
                title: movies[index]?.title ?? "",
                rate: movies[index]?.rating.toString() ?? "",
                year: movies[index]?.year.toString() ?? "",
                url: movies[index]?.url ?? "",
              ),
              childCount: movies.length,
            ),
          ),
        ),
      ],
    );
  }
}
