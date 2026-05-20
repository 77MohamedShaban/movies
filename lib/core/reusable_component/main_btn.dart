import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/resources/assets_manager.dart';

class MainBtn extends StatelessWidget {
  final String text;
  final void Function()? onClick;
  final bool isBorder;
  final bool isGoogleBtn;
  final double fontSize;
  final double? width;
  final bool exiteBtn;
  final bool redBackgroundColor;

  const MainBtn({
    super.key,
    required this.text,
    required this.onClick,
    this.isBorder = false,
    this.isGoogleBtn = false,
    this.fontSize = 20,
    this.width,
    this.exiteBtn = false,
    this.redBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isBorder
                ? Theme.of(context).colorScheme.primary
                : exiteBtn || redBackgroundColor
                ? Theme.of(context).colorScheme.error
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
            minimumSize: Size(width ?? double.infinity, 55.h),
          ),
          onPressed: onClick,
          child: Row(
            spacing: 12.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isGoogleBtn) SvgPicture.asset(AssetsManager.iconGoogle),
              Text(
                text,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: isBorder
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : exiteBtn
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
              if (exiteBtn) SvgPicture.asset(AssetsManager.exitIcon),
            ],
          ),
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(
          duration: 1200.ms,
          color: Colors.white.withValues(alpha: .5),
          angle: 45,
          stops: [0.4, 0.5, 0.6],
        );
  }
}
