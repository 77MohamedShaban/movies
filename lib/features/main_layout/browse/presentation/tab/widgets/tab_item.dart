import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  final String text;
  final bool selected;

  const TabItem({super.key, required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 2.w,
        ),
      ),
      child: Text(
        text,
        style: selected
            ? TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              )
            : TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
      ),
    );
  }
}
