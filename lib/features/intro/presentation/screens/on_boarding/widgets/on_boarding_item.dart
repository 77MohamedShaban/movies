import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatefulWidget {
  final String image;
  final String title;
  final String? des;
  final Color gradientColor;

  const OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    this.des,
    required this.gradientColor,
  });

  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();
}

class _OnBoardingItemState extends State<OnBoardingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, widget.gradientColor],
            stops: const [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if(widget.des == null)SizedBox(height: 16.h),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                if(widget.des != null)SizedBox(height: 16.h),
                if(widget.des != null)Text(
                  widget.des!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                if(widget.des == null)SizedBox(height: 10.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
