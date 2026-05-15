import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/resources/assets_manager.dart';

class LocalizationItem extends StatefulWidget {
  const LocalizationItem({super.key});

  @override
  State<LocalizationItem> createState() => _LocalizationItemState();
}

class _LocalizationItemState extends State<LocalizationItem> {
  String selectedLocalization = "en";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFlagItem(
            context: context,
            lang: "en",
            image: AssetsManager.usaFlag,
          ),

          _buildFlagItem(
            context: context,
            lang: "ar",
            image: AssetsManager.egyptFlag,
          ),
        ],
      ),
    );
  }

  Widget _buildFlagItem({
    required BuildContext context,
    required String lang,
    required String image,
  }) {
    final isSelected = selectedLocalization == lang;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLocalization = lang;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Colors.transparent,
            width: 4.w,
          ),
        ),
        child: SvgPicture.asset(
          image,
          height: isSelected ? 38.h : 34.h,
          width: isSelected ? 38.w : 34.w,
        ),
      ),
    );
  }
}