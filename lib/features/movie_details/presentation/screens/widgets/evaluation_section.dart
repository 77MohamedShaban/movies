import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvaluationSection extends StatelessWidget {
  const EvaluationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            spacing: 10.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer,
                size: 30,
              ),
              Text(
                "20",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Container(
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            spacing: 16.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.flip(
                flipX: true,
                child: Icon(
                    Icons.access_time_filled_outlined,
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer,
                    size: 30
                ),
              ),
              Text(
                "20",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Container(
          padding: REdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            spacing: 16.w,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Theme.of(
                  context,
                ).colorScheme.onPrimaryContainer,
                size: 30,
              ),
              Text(
                "20",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],);
  }
}
