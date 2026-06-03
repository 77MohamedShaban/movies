import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/strings_Manager.dart';
import '../../../../../../core/reusable_component/main_btn.dart';

class StartItem extends StatelessWidget {
  final VoidCallback onNext;
  const StartItem({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.onBoarding_1),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              ColorsManager.backgroundColor.withAlpha(127),
              ColorsManager.backgroundColor.withAlpha(232),
              ColorsManager.backgroundColor,
            ],
            stops: const [0, .39, .68, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                StringsManager.onBoardingTitle_1,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                StringsManager.onBoardingDes_1,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              MainBtn(
                text: StringsManager.exploreNow,
                onClick: onNext,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
