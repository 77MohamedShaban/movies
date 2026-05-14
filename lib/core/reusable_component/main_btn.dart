import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBtn extends StatelessWidget {
  final String text;
  final void Function()? onClick;
  final bool isBorder;

  const MainBtn({
    super.key,
    required this.text,
    required this.onClick,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isBorder
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: isBorder
              ? BorderSide(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  width: 2,
                )
              : BorderSide.none,
        ),
        minimumSize: Size.fromHeight(55.h),
      ),
      onPressed: onClick,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
          color: isBorder
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
