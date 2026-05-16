import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  final String? image;
  final double? rate;

  const MovieItem({super.key, required this.image, required this.rate});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: GestureDetector(
        onTap: (){}
        ,child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image?.toString() ?? ""),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: REdgeInsets.all(10),
              child: Container(
       padding:  REdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: .71),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.w,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("$rate", style: Theme.of(context).textTheme.labelSmall,),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
