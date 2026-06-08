import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/movie.dart';
import '../routes_manager/routes_name.dart';

class MovieItem extends StatelessWidget {
  final int? id;
  final String? image;
  final String? title;
  final String? year;
  final String? rate;
  final String? url;

  const MovieItem({
    super.key,
    required this.image,
    required this.title,
    required this.year,
    required this.rate,
    required this.id,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesName.movieDetails,
          arguments: Movie(
            image: image,
            rating: rate,
            title: title,
            year: year,
            id: id,
            url: url,
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: image ?? "",
        placeholder: (context, url) => Center(
          child: LoadingAnimationWidget.flickr(
            size: 30.sp,
            leftDotColor: Theme.of(context).colorScheme.onPrimary,
            rightDotColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error, size: 40.sp, color: Colors.red),
        ),
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: REdgeInsets.all(10),
                child: Container(
                  padding: REdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: .71),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.w,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        rate ?? "0",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
